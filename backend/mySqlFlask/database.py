from app import app
from flaskext.mysql import MySQL
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'jopi'
app.config['MYSQL_DATABASE_PASSWORD'] = 'jopi1234'
app.config['MYSQL_DATABASE_DB'] = 'IB_DB'
app.config['MYSQL_DATABASE_HOST'] = '192.168.178.19'
mysql.init_app(app)
