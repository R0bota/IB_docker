
# python base image
FROM python:3.6

# install flask
RUN pip3 install Flask
RUN pip3 install pymysql
RUN pip3 install flask-mysql
RUN pip3 install jsonify

RUN useradd -ms /bin/bash admin

USER admin

# set working directory
WORKDIR /app

# copy pytjon scripts to container
COPY mySqlFlask /app

# run flask app
CMD ["python", "functions.py"]