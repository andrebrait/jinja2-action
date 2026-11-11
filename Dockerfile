FROM python:3.11-slim@sha256:07d4824036af339fa1b6ef769cc99d9c10a141769538b52b3b597c84f7a7b535

WORKDIR /app
ENTRYPOINT ["/app/entrypoint.py"]

COPY poetry.lock pyproject.toml README.md ./
RUN pip install poetry==2.5.1 \
 && poetry config virtualenvs.create false \
 && poetry install --no-root

COPY *.py ./
COPY test/ ./test
