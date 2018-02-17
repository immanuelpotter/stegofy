FROM python:2-slim
RUN apt-get update
RUN apt-get install apache2 vim -y
ADD . /home
RUN mv /home/index.html /var/www/html/index.html
WORKDIR /home
RUN pip install -r requirements.txt
RUN ./installer.sh
RUN service apache2 start
