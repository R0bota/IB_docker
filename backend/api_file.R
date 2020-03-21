library(plumber)
library(ggplot2)

#source("backend/sql_functions.R")


#* @param text The text to be echoed in the response
#* @get /echo
function(text = "") {
  list(
    message_echo = paste("The text is:", text)
  )
}


#* @param userid 
#* @get /userdata
function(userid) {
  
  query <- paste("SELECT * from Test","WHERE userid = '",userid,"'") 
  df_user <- getTableQuery(query)
  return(df_user)
  
}


#* @param userid 
#* @get /realestate
function(userid) {
  #userid= 1
  query <- paste("SELECT * from realestate","WHERE userid = '",userid,"'") 
  df_user <- getTableQuery(query)
  return(df_user)
  
}







#* @param l The length
#* @param w The width
#* @get /area
function(l = 0,w = 0) {
 area=as.numeric(l)*as.numeric(w) 
 return(area)
}


#* Plot room
#* @png
#* @param l The length
#* @param w The width
#* @param name The name of the room
#* @get /room_plot
function(l, w, name=""){
#l=2
#w=4
  d=data.frame(x1=c(0), x2=c(as.numeric(l)), y1=c(0), y2=c(as.numeric(w)), r=paste0(c(name), ", ", as.numeric(l)*as.numeric(w), " qm"))
  
  p <- ggplot() +
    scale_x_continuous(name="Length") + 
    scale_y_continuous(name="Width") +
    geom_rect(data=d, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color="black",size=2, alpha=0.5) +
    geom_text(data=d, aes(x=x1+(x2-x1)/2, y=y1+(y2-y1)/2, label=r), size=4) +
    coord_fixed() + theme_minimal() 
  print(p)
}



