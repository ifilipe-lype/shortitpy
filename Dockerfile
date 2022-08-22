FROM python:3.8.10

RUN mkdir /usr/src/shortitpy

WORKDIR /usr/src/shortitpy

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN useradd -ms /bin/bash shortitpy \
    && python -m venv venv \
    && . venv/bin/activate

COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

USER shortitpy

CMD ["uvicorn", "shortipy.infra.http.server:app", "--host", "0.0.0.0", "--port", "80"]
