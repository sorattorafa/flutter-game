import mysql.connector
from flask import Flask
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast


mydb = mysql.connector.connect(option_files='configs/env.config', option_groups=['connection_details'])

mycursor = mydb.cursor()

#mycursor.execute("SHOW DATABASES")

#for x in mycursor:
#  print(x)

#mycursor.execute("""CREATE TABLE users (
#    id int NOT NULL AUTO_INCREMENT,
#    name varchar(255),
#    PRIMARY KEY (id)
#);""")

app = Flask(__name__)
api = Api(app)



class Users(Resource):
    # methods go here
    pass

class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}

api.add_resource(HelloWorld, '/hello')

if __name__ == '__main__':
    app.run(debug=True)