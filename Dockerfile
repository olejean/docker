FROM alpine:latest
RUN apk update && apk add py3-pip &&  apk add --update --no-cache python3
RUN ln -sf python3 /usr/bin/python &&  python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools &&    apk add libpq &&   apk add --no-cache --virtual build-deps gcc python3-dev musl-dev && apk add postgresql-dev &&  pip install psycopg2 &&   pip install Flask
ENTRYPOINT ["python", "./srv/app/web.py"]


