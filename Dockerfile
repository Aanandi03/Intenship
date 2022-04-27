FROM ubuntu:20.04

WORKDIR /app

RUN apt update && apt -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata

RUN apt install -y \
    libpq-dev \
    python3 \
    python3-pip

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8000/tcp

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

