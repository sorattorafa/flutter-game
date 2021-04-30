
import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from invalidusage import InvalidUsage
from flask_restful import fields, marshal_with

mydb = mysql.connector.connect(
    option_files='configs/env.config', option_groups=['connection_details'])
mycursor = mydb.cursor()

## TODO:  check result before commit

class UsersSignUp(Resource):
    def post(self):
        data = request.get_json()
        email = data['email']
        password = data['password']
        if(email == None or password == None):
            raise InvalidUsage('User not found', status_code=404)
        sql = "INSERT INTO users (email, password) VALUES (%s, %s)"
        val = (email, password)
        mycursor.execute(sql, val)
        mydb.commit()
        sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        adr = (email, password,)
        mycursor.execute(sql, adr)
        myresult = mycursor.fetchall()
        return myresult


class UsersLogin(Resource):
    def post(self):
        data = request.get_json()
        email = data['email']
        password = data['password']

        sql = "SELECT id, email FROM users WHERE email = %s AND password = %s"
        adr = (email, password,)
        mycursor.execute(sql, adr)

        myresult = mycursor.fetchall()
        if(len(myresult) <= 0):
            raise InvalidUsage('User not found', status_code=404)
        return myresult


class Pets(Resource):
    def post(self):
        data = request.get_json()
        name = data['name']
        imageUrl = data['image_url']
        userId = data['user_id']
        happy = data['happy']
        sleep = data['sleep']
        hungry = data['hungry']

        if(name == None or imageUrl == None or userId == None or happy == None or sleep == None or hungry == None):
            raise InvalidUsage('User not found', status_code=404)
        sql = "INSERT INTO pets (name, image_url, user_id, happy, sleep, hungry) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (name, imageUrl, userId, happy, sleep, hungry)
        mycursor.execute(sql, val)
        mydb.commit()
        myresult = mycursor.fetchall()
        return myresult

class GetPetsByUser(Resource):
    def get(self, user_id):
        print(user_id)

        #Retrieving single row
        sql = '''
        SELECT pets.id, pets.image_url, pets.sleep, pets.happy, pets.hungry 
        FROM users INNER JOIN pets ON users.id = pets.user_id 
        WHERE users.id = %s
        '''
        
        val = (user_id,)

        mycursor.execute(sql, val)

        myresult = mycursor.fetchall()

        for x in myresult:
            print(x)

        return myresult  # myresult
