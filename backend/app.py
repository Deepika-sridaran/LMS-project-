from routes.auth_routes import auth_bp
from flask import Flask
from flask_cors import CORS

from config import Config
from extensions import db, bcrypt, jwt, migrate


def create_app():
    app = Flask(__name__)

    # Load configuration
    app.config.from_object(Config)

    # Initialize extensions
    db.init_app(app)
    bcrypt.init_app(app)
    jwt.init_app(app)
    migrate.init_app(app, db)

    # Enable frontend access
    CORS(app)
    app.register_blueprint(auth_bp, url_prefix="/api/auth")

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