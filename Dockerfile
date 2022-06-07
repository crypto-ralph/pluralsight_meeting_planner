# syntax=docker/dockerfile:1

FROM python:3.10


ENV PYTHONPATH=${PYTHONPATH}:${PWD} 
RUN pip3 install poetry

WORKDIR /app
COPY poetry.lock pyproject.toml /app/

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY . /app

RUN poetry shell

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]

EXPOSE 8000
EXPOSE 8080/tcp