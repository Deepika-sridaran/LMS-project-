from flask import jsonify
from flask_jwt_extended import get_jwt_identity

from services.enrollment_service import (
    enroll_student,
    get_student_enrollments,
    get_student_enrollment,
    cancel_student_enrollment
)


def create_enrollment(course_id):
    student_id = int(
        get_jwt_identity()
    )

    response, status_code = enroll_student(
        course_id,
        student_id
    )

    return jsonify(response), status_code


def list_enrollments():
    student_id = int(
        get_jwt_identity()
    )

    response, status_code = get_student_enrollments(
        student_id
    )

    return jsonify(response), status_code


def enrollment_details(enrollment_id):
    student_id = int(
        get_jwt_identity()
    )

    response, status_code = get_student_enrollment(
        enrollment_id,
        student_id
    )

    return jsonify(response), status_code


def cancel_enrollment(enrollment_id):
    student_id = int(
        get_jwt_identity()
    )

    response, status_code = cancel_student_enrollment(
        enrollment_id,
        student_id
    )

    return jsonify(response), status_code