from extensions import db


class Enrollment(db.Model):
    __tablename__ = "enrollments"

    enrollment_id = db.Column(
        db.Integer,
        primary_key=True
    )

    student_id = db.Column(
        db.Integer,
        nullable=False
    )

    course_id = db.Column(
        db.Integer,
        nullable=False
    )

    status = db.Column(
        db.String(20),
        nullable=False
    )

    enrolled_at = db.Column(
        db.DateTime,
        nullable=True
    )