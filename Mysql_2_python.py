import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="Munezero",
    password="Munezero25",
    database="univdb"
)

mycursor = mydb.cursor()

mycursor.execute("""CREATE TABLE customers(name VARCHAR(255),
address VARCHAR(255))""")

sql = "INSERT INTO customers(name, address) values(%s, %s)"
val = [("John", "Highway 21"),
       ("Ricard", "Sky st 331")]

mycursor.executemany(sql, val)
# mycursor.execute(sql, val) in case there is one to execute
mycursor.commit()

mycursor.execute("SELECT * FROM customers")
myresult = mycursor.fetchall()
for x in myresult:
    print(x)
