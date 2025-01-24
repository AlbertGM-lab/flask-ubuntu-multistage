# Etapa 1: Construcción
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive \
    VENV_PATH=/venv

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv gcc libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv $VENV_PATH
RUN $VENV_PATH/bin/pip install --upgrade pip setuptools wheel
WORKDIR /app
COPY app.py /app/app.py
COPY templates /app/templates
COPY static /app/static
COPY requirements.txt /app/requirements.txt

RUN $VENV_PATH/bin/pip install --no-cache-dir -r requirements.txt

# Etapa 2: Producción
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    VENV_PATH=/venv \
    PATH="/venv/bin:$PATH"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends python3 curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd --no-create-home --home-dir /app flaskuser

WORKDIR /app
COPY --from=builder $VENV_PATH $VENV_PATH
COPY --from=builder /app /app

RUN chown -R flaskuser:flaskuser /app
USER flaskuser

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/health || exit 1

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "app:app"]