#load libraries

getCredentials <- function(select){
 
  return(switch(select, 
                "user" = "jopi", 
                "password" = "jopi1234", 
                "dbname" = "IB_DB",
                "host"="192.168.178.19"))
}

