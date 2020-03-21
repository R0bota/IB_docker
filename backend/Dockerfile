# parent image
FROM resin/raspberrypi3-debian:latest

ENTRYPOINT []

# enable systemd
ENV INITSYSTEM on

# update sources
RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ buster main" > /etc/apt/sources.list

# install R
RUN apt-get update && apt-get install -y \ 
  r-base \ 
  r-base-core \
  r-base-dev

# copy scripts from raspberry into container
COPY src /usr/local/src/myscripts

# set working directory
WORKDIR /usr/local/src/myscripts

RUN R -e "install.packages('plumber',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('swagger',dependencies=TRUE, repos='http://cran.rstudio.com/')"

CMD ["Rscript", "main.R"]
