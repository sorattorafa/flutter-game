
import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from invalidusage import InvalidUsage

mydb = mysql.connector.connect(option_files='configs/env.config', option_groups=['connection_details'])
mycursor = mydb.cursor()

class UsersSignUp(Resource):
    def post(self):
        data = request.get_json()
        email = data['email']
        password = data['password']
        sql = "INSERT INTO users (email, password) VALUES (%s, %s)"
        val = (email, password)
        mycursor.execute(sql, val)
        mydb.commit()
        sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        adr = (email,password,)
        mycursor.execute(sql, adr)
        myresult = mycursor.fetchall()
        return myresult

class UsersLogin(Resource):
    def post(self):
        data = request.get_json()
        email = data['email']
        password = data['password']
     
        sql = "SELECT id, email FROM users WHERE email = %s AND password = %s"
        adr = (email,password,)
        mycursor.execute(sql, adr)

        myresult = mycursor.fetchall()
        if(len(myresult) <= 0):
            raise InvalidUsage('User not found', status_code=404)
        return myresult
