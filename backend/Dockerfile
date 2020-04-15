
# python base image
FROM python:3.6

RUN useradd -ms /bin/bash admin

USER admin

# set working directory
WORKDIR /app

# copy pytjon scripts to container
ADD mySqlFlask /app
ADD requirements.txt /app

# install packages
RUN pip3 install -r requirements.txt

# run flask app
CMD ["python", "functions.py"]