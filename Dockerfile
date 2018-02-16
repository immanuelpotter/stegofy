FROM python:2-slim
RUN apt-get update
ADD . /home
WORKDIR /home
RUN pip install -r requirements.txt
RUN ./installer.sh
