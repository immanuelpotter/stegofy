FROM ubuntu
RUN apt-get update
RUN apt-get install -y git python-pip python-dev build-essential ssh vim
ADD . /home
RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv
RUN pip install -r /home/requirements.txt
CMD ["/bin/bash"]
