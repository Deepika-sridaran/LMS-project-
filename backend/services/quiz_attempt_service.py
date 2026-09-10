from datetime import datetime, timedelta

from sqlalchemy import text

from models.quiz import Quiz
from models.question import Question
from models.quiz_attempt import QuizAttempt
from models.quiz_answer import QuizAnswer
from extensions import db


def is_student_enrolled(student_id, course_id):
    result = db.session.execute(
        text("""
            SELECT enrollment_id
            FROM enrollments
            WHERE student_id = :student_id
              AND course_id = :course_id
              AND status = 'ACTIVE'
        """),
        {
            "student_id": student_id,
            "course_id": course_id
        }
    ).fetchone()

    return result is not None


def start_attempt(quiz_id, student_id):
    quiz = Quiz.query.get(quiz_id)

    if quiz is None:
        return None, "Quiz not found"

    if not is_student_enrolled(
        student_id,
        quiz.course_id
    ):
        return None, "You are not enrolled in this course"

    existing_attempts = QuizAttempt.query.filter_by(
        quiz_id=quiz_id,
        student_id=student_id
    ).all()

    if len(existing_attempts) >= quiz.maximum_attempts:
        return None, "Maximum attempts reached"

    attempt_number = len(existing_attempts) + 1

    attempt = QuizAttempt(
        quiz_id=quiz_id,
        student_id=student_id,
        attempt_number=attempt_number,
        started_at=datetime.utcnow(),
        status="IN_PROGRESS"
    )

    db.session.add(attempt)
    db.session.commit()

    return attempt, None


def get_attempt(attempt_id, student_id):
    attempt = QuizAttempt.query.get(attempt_id)

    if attempt is None:
        return None, "Attempt not found"

    if attempt.student_id != student_id:
        return None, "You do not own this attempt"

    return attempt, None


def submit_attempt(attempt_id, student_id, answers):
    attempt = QuizAttempt.query.get(attempt_id)

    if attempt is None:
        return None, "Attempt not found"

    if attempt.student_id != student_id:
        return None, "You do not own this attempt"

    if attempt.status != "IN_PROGRESS":
        return None, "Attempt has already been submitted"

    quiz = Quiz.query.get(attempt.quiz_id)

    if quiz is None:
        return None, "Quiz not found"

    now = datetime.utcnow()

    if (
        attempt.started_at
        and now > attempt.started_at
        + timedelta(minutes=quiz.time_limit)
    ):
        attempt.status = "SUBMITTED"
        attempt.submitted_at = now
        attempt.score = 0
        attempt.passed = False

        db.session.commit()

        return None, "Quiz time limit exceeded"

    questions = Question.query.filter_by(
        quiz_id=quiz.quiz_id
    ).all()

    total_score = 0

    for answer in answers:
        question_id = answer.get("question_id")

        selected_answer = str(
            answer.get("selected_answer", "")
        ).upper()

        question = next(
            (
                q for q in questions
                if q.question_id == question_id
            ),
            None
        )

        if question is None:
            continue

        if selected_answer not in [
            "A",
            "B",
            "C",
            "D"
        ]:
            continue

        marks_awarded = 0

        if selected_answer == question.correct_answer:
            marks_awarded = float(question.marks)
            total_score += marks_awarded

        quiz_answer = QuizAnswer(
            attempt_id=attempt.attempt_id,
            question_id=question.question_id,
            selected_answer=selected_answer,
            marks_awarded=marks_awarded
        )

        db.session.add(quiz_answer)

    total_marks = sum(
        float(question.marks)
        for question in questions
    )

    percentage = 0

    if total_marks > 0:
        percentage = (
            total_score / total_marks
        ) * 100

    attempt.score = percentage

    attempt.passed = (
        percentage >= float(
            quiz.passing_score
        )
    )

    attempt.status = "SUBMITTED"
    attempt.submitted_at = now

    db.session.commit()

    return attempt, None