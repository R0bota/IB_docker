#load libraries
library(RPostgreSQL)
#library(devtools)
#library(remotes)
#library(RPostgres)
#library(DBI)




getCredentials <- function(select){
 
  return(switch(select, 
                "user" = "user", 
                "password" = "pw", 
                "dbname" = "IB_docker",
                "host"="localhost",
                "port"= "1234",
                "schema"="-c search_path="))
  
}



# functions
getTableQuery <- function(dbquery){
  tryCatch(
    expr = {
      db <- dbConnect(RPostgres::Postgres(), 
                      dbname=getCredentials("dbname"), 
                      host= getCredentials("host"), 
                      port= getCredentials("port"), 
                      user=getCredentials("user"), 
                      password=getCredentials("password"), 
                      options=getCredentials("schema"))
      
      df <- dbGetQuery(db,dbquery)
    },
    error = function(e){
      #message('Caught an error!')
      #print(e)
      df <- ""
    },
    warning = function(w){
      #message('Caught an warning!')
      #print(w)
      df <- ""
    },
    finally = {
      #message('All done, quitting.')
      dbDisconnect(db) 
      
    }
  )    
  return(df)
}


sendQUery <- function(dbquery){
  
  db <- dbConnect(RPostgres::Postgres(), 
                  dbname=getCredentials("dbname"), 
                  host= getCredentials("host"), 
                  port= getCredentials("port"), 
                  user=getCredentials("user"), 
                  password=getCredentials("password"), 
                  options=getCredentials("schema"))
  
  res <- dbSendQuery(db, dbquery)

  return()
  
}



