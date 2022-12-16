from dotenv import load_dotenv

import os
load_dotenv()
user = os.environ["MYSQL_USER"]
password = os.environ["MYSQL_PASSWORD"]
database = os.environ["MYSQL_DATABASE"]

SQL_DATABASE_URI = f'mysql://{user}:{password}@localhost/{database}'