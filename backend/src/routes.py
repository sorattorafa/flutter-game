
import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from invalidusage import InvalidUsage
from flask_restful import fields, marshal_with
import datetime
import json

mydb = mysql.connector.connect(
    option_files='src/configs/env.config', option_groups=['connection_details'])
mycursor = mydb.cursor()

# TODO:  check result before commit


class DateTimeEncoder(json.JSONEncoder):
    def default(self, z):
        if isinstance(z, datetime.datetime):
            return (str(z))
        else:
            return z


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
            raise InvalidUsage('Invalid body', status_code=400)

        sql = "INSERT INTO pets (name, image_url, user_id, happy, sleep, hungry) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (name, imageUrl, userId, happy, sleep, hungry)
        mycursor.execute(sql, val)
        mydb.commit()
        myresult = mycursor.fetchall()
        pet_id = mycursor.lastrowid

        sql = '''
        SELECT id, image_url, sleep, happy, hungry, name, life, last_eat, last_sleep, last_play, last_bath, clean
        FROM pets
        WHERE id = %s
        '''

        val = (pet_id,)
        mycursor.execute(sql, val)
        myresult = mycursor.fetchall()
        result = myresult[0]
        # this will extract row headers
        json_data = {
            'id': result[0],
            'image_url': result[1],
            'sleep': result[2],
            'happy': result[3],
            'hungry': result[4],
            'name': result[5],
            'life': result[6],
            'last_eat': json.dumps(result[7], cls=DateTimeEncoder),
            'last_sleep': json.dumps(result[8], cls=DateTimeEncoder),
            'last_play': json.dumps(result[9], cls=DateTimeEncoder),
            'last_bath': json.dumps(result[10], cls=DateTimeEncoder),
            'clean': result[11]
        }
        return json_data  # json.dumps(json_data,cls=DateTimeEncoder)


class GetPetsByUser(Resource):
    def get(self, user_id):

        sql = '''
        SELECT pets.id, pets.image_url, pets.sleep, pets.happy, pets.hungry, pets.name, pets.life, pets.last_eat, pets.last_sleep, pets.last_play, pets.last_bath, pets.clean
        FROM users INNER JOIN pets ON users.id = pets.user_id
        WHERE users.id = %s
        '''

        val = (user_id,)
        mycursor.execute(sql, val)
        myresult = mycursor.fetchall()
        response = []

        for result in myresult:
            print(result)
            json_data = {
                'id': result[0],
                'image_url': result[1],
                'sleep': result[2],
                'happy': result[3],
                'hungry': result[4],
                'name': result[5],
                'life': result[6],
                'last_eat': json.dumps(result[7], cls=DateTimeEncoder),
                'last_sleep': json.dumps(result[8], cls=DateTimeEncoder),
                'last_play': json.dumps(result[9], cls=DateTimeEncoder),
                'last_bath': json.dumps(result[10], cls=DateTimeEncoder),
                'clean': result[11]
            }
        response.append(json_data)
        return response  # myresult
