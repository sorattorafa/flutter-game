import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast


mydb = mysql.connector.connect(option_files='configs/env.config', option_groups=['connection_details'])

mycursor = mydb.cursor()

app = Flask(__name__)
api = Api(app)



class Users(Resource):
    # methods go here
    pass

class Users(Resource):
    def post(self):
        data = request.get_json()
        email = data['email']
        password = data['password']
        sql = "INSERT INTO users (email, password) VALUES (%s, %s)"
        val = (email, password)
        mycursor.execute(sql, val)
        mydb.commit()
        return {'hello': 'world'}

api.add_resource(Users, '/post/user')

if __name__ == '__main__':
    app.run(debug=True)