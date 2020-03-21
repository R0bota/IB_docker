
#* @param userid 
#* @get /userdata
function(userid) {
  #userid = 1
  query <- paste("SELECT * from ibuser","WHERE userid = '",userid,"'") 
  
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  df <- dbGetQuery(connect,query)
  return(df)
  
}


#* @param userid 
#* @get /realestate
function(userid) {
  #userid= 1
  query <- paste("SELECT * from realestate","WHERE userid = '",userid,"'") 
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  df <- dbGetQuery(connect,query)
  return(df)
  
}



#* @param immoid 
#* @get /rooms
function(immoid) {
 
  query <- paste0("SELECT * from room ","WHERE userid2 = '",immoid,"'") 
  
  connect <- dbConnect(MySQL(), 
                       user = getCredentials("user"), 
                       password = getCredentials("password"), 
                       dbname = getCredentials("dbname"),
                       host=getCredentials("host"))
  df <- dbGetQuery(connect,query)
  dbDisconnect(connect)
  
  return(df)
  
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






#* @png
#* @param roomid The id of the room
#* @get /room_plot_id

function(roomid){
  #roomid=1
  query <- paste("SELECT * from room","WHERE userid3 = '",roomid,"'") 
  df_room <- getTableQuery(query)
  
  l = df_room$length
  w = df_room$width
  
  d=data.frame(x1=c(0), x2=c(as.numeric(l)), y1=c(0), y2=c(as.numeric(w)), r=paste0(c(df_room$name), ", ", as.numeric(l)*as.numeric(w), " qm"))
  
  p <- ggplot() +
    scale_x_continuous(name="Length") + 
    scale_y_continuous(name="Width") +
    geom_rect(data=d, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color="black",size=2, alpha=0.5) +
    geom_text(data=d, aes(x=x1+(x2-x1)/2, y=y1+(y2-y1)/2, label=r), size=4) +
    coord_fixed() + theme_minimal() 
  print(p)
}



