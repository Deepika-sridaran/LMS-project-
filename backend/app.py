from flask import Flask
from flask_cors import CORS

from config import Config
from extensions import db, bcrypt, jwt, migrate

from routes.auth_routes import auth_bp
from routes.user_routes import user_bp
from routes.category_routes import category_bp

from routes.progress_routes import progress_bp
from routes.assignment_routes import assignment_bp
from routes.submission_routes import submission_bp
from routes.certificate_routes import certificate_bp
from routes.review_routes import review_bp
from routes.notification_routes import notification_bp
from routes.dashboard_routes import dashboard_bp
from routes.quiz_routes import quiz_bp
from routes.quiz_attempt_routes import quiz_attempt_bp


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

    app.register_blueprint(progress_bp)
    app.register_blueprint(assignment_bp)
    app.register_blueprint(submission_bp)
    app.register_blueprint(certificate_bp)
    app.register_blueprint(review_bp)
    app.register_blueprint(notification_bp)
    app.register_blueprint(dashboard_bp)
    app.register_blueprint(quiz_bp)
    app.register_blueprint(quiz_attempt_bp)

    @app.route("/")
    def home():
        return {
            "success": True,
            "message": "LMS Backend API is running"
        }, 200

    @app.route("/database-test")
    def database_test():
        try:
            db.session.execute(db.text("SELECT 1"))

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