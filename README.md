# pets
Pets game made with Docker, Python, Mysql, and Flutter.

## Getting Started

### Database

###  Run docker container with mysql8 using commands:

-  docker run -p 33060:3306 --name local-mysql -e MYSQL_ROOT_PASSWORD=mypass -d mysql:8

### Set config/env.config connection with docker image
```
[connection_details]
host = localhost ou 127.0.0.0
database = pets
user = root
password = mypass
port  = 3306
```

### run backend migrations: 
```bash 
cd backend
python3 src/migrations.py
```
### run backend: 
```bash 
cd backend
python3 src/main.py
```
### References

- https://flask-restful.readthedocs.io/en/latest/
- https://www.mssqltips.com/sqlservertip/5173/encrypting-passwords-for-use-with-python-and-sql-server/
