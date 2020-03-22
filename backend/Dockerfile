# parent image
FROM resin/raspberrypi3-debian:latest
#FROM rocker/r-ver:3.4.4

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

RUN R -e "options(repos = \
  list(CRAN = 'http://cran.rstudio.com/')); \
  install.packages('plumber')"

# copy scripts from raspberry into container
COPY src /usr/local/src/myscripts

# set working directory
WORKDIR /usr/local/src/myscripts

CMD ["Rscript", "main.R"]
