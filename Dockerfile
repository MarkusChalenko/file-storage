FROM python:3.10

RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    rm -rf /var/lib/apt/lists/* \

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

COPY ./.env .
COPY alembic.ini .
COPY src ./src/

CMD while ! nc -z $DB_HOST $DB_PORT; do \
      sleep 0.1; \
    done && \
    alembic upgrade head

ENTRYPOINT ["python3", "src/main.py"]