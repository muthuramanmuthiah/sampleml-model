#FROM ubuntu:latest
#ARG DEBIAN_FRONTEND=noninteractive
#RUN apt-get update && apt-get install -y python3.6 && apt-get install -y python3-pip && apt-get install -y --no-install-recommends nginx ca-certificates && rm -rf /var/lib/apt/lists/*
#RUN pip3 install numpy scikit-learn boto3 nltk xlrd flask gevent gunicorn && rm -rf /root/.cache 
#ENV PYTHONUNBUFFERED=TRUE
#ENV PYTHONDONTWRITEBYTECODE=TRUE
#ENV PATH="/opt/program:${PATH}"
#COPY training/ /opt/program
#ENTRYPOINT ["python3", "/opt/program/training/train.py"]

FROM python:3
RUN pip install numpy scikit-learn boto3 nltk xlrd flask gevent gunicorn
WORKDIR /usr/src/app
COPY training/ .
CMD [ "python", "./training/train.py" ]