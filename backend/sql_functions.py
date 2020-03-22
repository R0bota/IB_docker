import mysql.connector
mydb = mysql.connector.connect(
  host="192.168.178.19",
  user="jopi",
  passwd="jopi1234",
  database="IB_DB"
)
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM room")
myresult = mycursor.fetchall()
for x in myresult:
  print(x)

