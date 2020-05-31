# source image
FROM python:stretch

# app workdir
WORKDIR /app
COPY . /app

# upgrade pip, install reqs
RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["gunicorn", "-b", ":8080", "main:APP"]