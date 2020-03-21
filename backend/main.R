#libraries
library(plumber)
library(swagger)
library(plumber)
library(ggplot2)
library(DBI)
library(RODBC)
library(RMySQL)

#load sql file


source("backend/sql_function.R")

#run api server
plumber::plumb("backend/api_file.R")$run(port = 5762)
