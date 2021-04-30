import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from routes import UsersLogin, UsersSignUp, Pets, GetPetsByUser


app = Flask(__name__)
api = Api(app)

api.add_resource(UsersLogin, '/users/login')
api.add_resource(UsersSignUp, '/users/signup')
api.add_resource(Pets, '/pets/post')
api.add_resource(GetPetsByUser, '/user/pets/<user_id>', endpoint='')

if __name__ == '__main__':
    app.run(debug=True)