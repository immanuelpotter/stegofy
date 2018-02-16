FROM python:2-slim
RUN apt-get update
RUN apt-get install apache2 -y
ADD . /home
WORKDIR /home
RUN pip install -r requirements.txt
RUN ./installer.sh
RUN service apache2 start
