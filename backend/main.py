import mysql.connector
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import pandas as pd
import ast
from routes import UsersLogin, UsersSignUp

app = Flask(__name__)
api = Api(app)

api.add_resource(UsersLogin, '/users/login')
api.add_resource(UsersSignUp, '/users/signup')

if __name__ == '__main__':
    app.run(debug=True)