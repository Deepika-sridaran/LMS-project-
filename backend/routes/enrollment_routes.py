from flask import Blueprint

from controllers.enrollment_controller import (
    create_enrollment,
    list_enrollments,
    enrollment_details,
    cancel_enrollment
)

from utils.auth_utils import role_required


enrollment_bp = Blueprint(
    "enrollments",
    __name__
)


@enrollment_bp.route(
    "/courses/<int:course_id>/enroll",
    methods=["POST"]
)
@role_required("Student")
def enroll_course_route(course_id):
    return create_enrollment(course_id)


@enrollment_bp.route(
    "/enrollments",
    methods=["GET"]
)
@role_required("Student")
def get_enrollments_route():
    return list_enrollments()


@enrollment_bp.route(
    "/enrollments/<int:enrollment_id>",
    methods=["GET"]
)
@role_required("Student")
def get_enrollment_route(enrollment_id):
    return enrollment_details(enrollment_id)


@enrollment_bp.route(
    "/enrollments/<int:enrollment_id>/cancel",
    methods=["PATCH"]
)
@role_required("Student")
def cancel_enrollment_route(enrollment_id):
    return cancel_enrollment(enrollment_id)