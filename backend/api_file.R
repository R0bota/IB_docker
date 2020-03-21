library(plumber)




#* @param text The text to be echoed in the response
#* @get /echo
function(text = "") {
  list(
    message_echo = paste("The text is:", text)
  )
}


#* @param userid 
#* @get /userdata
function(userid = "") {
  #conect to database
  df_user <- getTableQuery(paste0("SELECT * FROM userdata WHERE id = '",userid,"'"))
  
  return(df_user)
}


#* @param l The length
#* @param w The width
#* @get /area
function(l = 0,w = 0) {
 area=as.numeric(l)*as.numeric(w) 
 return(area)
}


#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}