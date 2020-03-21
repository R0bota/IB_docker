#libraries
library(plumber)
library(swagger)
#load sql file
source("backend/sql_functions.R")


#run api server
plumber::plumb("backend/api_file.R")$run(port = 5762)
