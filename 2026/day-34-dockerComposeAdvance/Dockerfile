# Base Image
FROM python:3.12-slim

# Working Directory
WORKDIR /app

# Ingredients
COPY . /app

# Mix

RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Gas On
CMD ["python", "app.py"]