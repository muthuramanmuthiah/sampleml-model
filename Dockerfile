FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3.6 && apt-get install -y python3-pip && apt-get install -y --no-install-recommends nginx ca-certificates && rm -rf /var/lib/apt/lists/*
RUN pip3 install numpy scikit-learn boto3 nltk xlrd flask gevent gunicorn && rm -rf /root/.cache 
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
#set path for training file
ENV PATH="/opt/ml/training:${PATH}"
COPY training /opt/ml/training
RUN echo $(ls -1 /opt/ml/training)
#path for outputfile
RUN mkdir -p /opt/ml/model
ENTRYPOINT ["python3", "/opt/ml/training/train.py"]
