import mysql.connector

mydb = mysql.connector.connect(option_files='src/configs/env.config', option_groups=['connection_details'])

mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
  print(x)

mycursor.execute("""CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id)
);""")

mycursor.execute("""CREATE TABLE pets(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    user_id INT,
    sleep INT,
    hungry INT,
    happy INT,
    life INT DEFAULT 100,
    image_url varchar(100) NOT NULL,
    CONSTRAINT fk_users
    FOREIGN KEY (user_id) 
        REFERENCES users(id)
);""")