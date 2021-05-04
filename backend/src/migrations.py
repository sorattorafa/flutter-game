import mysql.connector

mydb = mysql.connector.connect(
    option_files='src/configs/env.config', option_groups=['connection_details'])

mycursor = mydb.cursor()

#mycursor.execute("SHOW DATABASES")
# for x in mycursor:
#    print(x)

sqlDrops = ['DROP TABLE IF EXISTS pets_clock',
            'DROP TABLE IF EXISTS pets', 'DROP TABLE IF EXISTS users']

for drop in sqlDrops:
    mycursor.execute(drop)

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
    sleep INT DEFAULT 100,
    hungry INT DEFAULT 100,
    happy INT DEFAULT 100,
    clean INT DEFAULT 100,
    life INT DEFAULT 100,
    image_url varchar(100) NOT NULL,
    last_sleep DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_eat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_play DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_bath DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_users
    FOREIGN KEY (user_id) 
        REFERENCES users(id)
);
""")
