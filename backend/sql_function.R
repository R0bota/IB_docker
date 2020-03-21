#load libraries

getCredentials <- function(select){
 
  return(switch(select, 
                "user" = "jopi", 
                "password" = "jopi1234", 
                "dbname" = "IB_DB",
                "host"="192.168.178.19"))
}

getDatabasecon <- function(){
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  return(connect)
}


getTableQuery <- function(dbquery){
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  on.exit(dbDisconnect(connect))
  
  df <- dbGetQuery(connect,dbquery)
  dbDisconnect(connect) 
  return(df)
}

sendQUery <- function(dbquery){
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  res <- dbSendQuery(connect, dbquery)
  dbDisconnect(connect) 
  return()
}


listTables <- function(){
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  list <- dbGetQuery(connect,"SELECT table_name FROM information_schema.tables")
  dbDisconnect(connect) 
  return(list)
}

