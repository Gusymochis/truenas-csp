FROM alpine:3
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --upgrade pip && \
    mkdir /app
ADD requirements.txt /
RUN pip3 install -r requirements.txt
ADD truenascsp/*.py /app/
WORKDIR /app
ENTRYPOINT [ "gunicorn", "--workers", "3", "--bind", "0.0.0.0:8080", "--timeout", "60", "csp:SERVE" ]
