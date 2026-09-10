from extensions import db


class Lesson(db.Model):
    __tablename__ = "lessons"

    lesson_id = db.Column(
        db.Integer,
        primary_key=True
    )

    module_id = db.Column(
        db.Integer,
        nullable=False
    )

    lesson_name = db.Column(
        db.String(200),
        nullable=False
    )

    description = db.Column(
        db.Text,
        nullable=True
    )

    lesson_order = db.Column(
        db.Integer,
        nullable=False
    )