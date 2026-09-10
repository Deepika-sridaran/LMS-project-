from datetime import datetime

from models.submission import Submission
from models.assignment import Assignment
from extensions import db


def create_submission(
    assignment_id,
    student_id,
    file_path=None,
    comments=None
):
    assignment = Assignment.query.get(assignment_id)

    if assignment is None:
        return None, "Assignment not found"

    existing = Submission.query.filter_by(
        assignment_id=assignment_id,
        student_id=student_id
    ).first()

    if existing:
        return None, "Submission already exists"

    now = datetime.utcnow()

    status = "SUBMITTED"

    if assignment.deadline and now > assignment.deadline:
        status = "LATE"

    submission = Submission(
        assignment_id=assignment_id,
        student_id=student_id,
        file_path=file_path,
        comments=comments,
        status=status,
        submitted_at=now
    )

    db.session.add(submission)
    db.session.commit()

    return submission, None


def get_submission(submission_id):
    return Submission.query.get(submission_id)


def update_submission(
    submission_id,
    file_path=None,
    comments=None
):
    submission = Submission.query.get(submission_id)

    if submission is None:
        return None, "Submission not found"

    if submission.status == "EVALUATED":
        return None, "Evaluated submissions cannot be modified"

    if file_path is not None:
        submission.file_path = file_path

    if comments is not None:
        submission.comments = comments

    db.session.commit()

    return submission, None


def get_assignment_submissions(assignment_id):
    return Submission.query.filter_by(
        assignment_id=assignment_id
    ).all()


def evaluate_submission(
    submission_id,
    marks,
    feedback
):
    submission = Submission.query.get(submission_id)

    if submission is None:
        return None, "Submission not found"

    assignment = Assignment.query.get(
        submission.assignment_id
    )

    if assignment is None:
        return None, "Assignment not found"

    if marks < 0:
        return None, "Marks cannot be negative"

    if marks > float(assignment.maximum_marks):
        return None, "Marks cannot exceed maximum marks"

    submission.marks = marks
    submission.feedback = feedback
    submission.status = "EVALUATED"
    submission.evaluated_at = datetime.utcnow()

    db.session.commit()

    return submission, None