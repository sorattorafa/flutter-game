import mysql.connector

mydb = mysql.connector.connect(option_files='configs/env.config', option_groups=['connection_details'])

mycursor = mydb.cursor()

#mycursor.execute("SHOW DATABASES")

#for x in mycursor:
#  print(x)

mycursor.execute("""CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    PRIMARY KEY (id)
);""")

