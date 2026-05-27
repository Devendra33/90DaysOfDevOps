from flask import Flask
import mysql.connector
import redis
import os

app = Flask(__name__)

@app.route("/")
def home():

    # MySQL connection
    db = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

    cursor = db.cursor()
    cursor.execute("SELECT DATABASE();")
    db_name = cursor.fetchone()

    # Redis connection
    r = redis.Redis(host=os.getenv("REDIS_HOST"), port=6379)
    r.set("message", "Hello from Redis!")

    redis_msg = r.get("message").decode()

    return f"""
    <h1>Hello from Flask App 🚀</h1>

    <p>Connected MySQL Database: {db_name[0]}</p>

    <p>Redis Message: {redis_msg}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)