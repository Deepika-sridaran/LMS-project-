from flask import Flask
from flask_cors import CORS

from config import Config
from extensions import db, bcrypt, jwt, migrate

from routes.auth_routes import auth_bp
from routes.user_routes import user_bp
from routes.category_routes import category_bp
from routes.course_routes import course_bp
from routes.course_workflow_routes import course_workflow_bp
from routes.quiz_routes import quiz_bp
from routes.quiz_attempt_routes import quiz_attempt_bp
from routes.module_lesson_routes import module_lesson_bp


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    bcrypt.init_app(app)
    jwt.init_app(app)
    migrate.init_app(app, db)
    CORS(app)

    app.register_blueprint(
        auth_bp,
        url_prefix="/api/auth"
    )

    app.register_blueprint(
        user_bp,
        url_prefix="/api/users"
    )

    app.register_blueprint(
        category_bp,
        url_prefix="/api/categories"
    )

    app.register_blueprint(
        course_bp,
        url_prefix="/api/courses"
    )

    app.register_blueprint(
        course_workflow_bp,
        url_prefix="/api/courses"
    )

    app.register_blueprint(
        quiz_bp
    )

    app.register_blueprint(
        quiz_attempt_bp
    )

    app.register_blueprint(
        module_lesson_bp,
        url_prefix="/api"
    )

    @app.route("/")
    def home():
        return {
            "success": True,
            "message": "LMS Backend API is running"
        }, 200

    @app.route("/database-test")
    def database_test():
        try:
            db.session.execute(
                db.text("SELECT 1")
            )

            return {
                "success": True,
                "message": "Flask connected to LMS MySQL database successfully"
            }, 200

        except Exception as error:
            return {
                "success": False,
                "message": "Database connection failed",
                "error": str(error)
            }, 500

    return app


app = create_app()


if __name__ == "__main__":
    app.run(debug=True)