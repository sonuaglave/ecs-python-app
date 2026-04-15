FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]

aws ecr get-login-password ...
docker build -t ecs-python-app .
docker tag ecs-python-app:latest <741044885094.dkr.ecr.ap-south-1.amazonaws.com/ecs-python-app>:latest
docker push <741044885094.dkr.ecr.ap-south-1.amazonaws.com/ecs-python-app>:latest
