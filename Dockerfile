FROM python:3.10

WORKDIR /app

COPY requirements.txt .

COPY ./.env .

RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

COPY alembic.ini .
COPY src ./src/

CMD alembic upgrade head

ENTRYPOINT ["python3", "src/main.py"]