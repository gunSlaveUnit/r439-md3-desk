from enum import Enum
from pathlib import Path

from dotenv import dotenv_values

DEBUG = True

BASE_PATH = Path(__file__).resolve().parent.parent.parent
ENVS_PATH = BASE_PATH / 'envs'

if DEBUG:
    ENVS_PATH = ENVS_PATH / 'dev'
else:
    ENVS_PATH = ENVS_PATH / 'prod'

admin_config = dotenv_values(ENVS_PATH / ".admin")
redis_config = dotenv_values(ENVS_PATH / ".redis")
database_config = dotenv_values(ENVS_PATH / ".db")

if DEBUG:
    CONNECTION_STRING = f"sqlite:///{BASE_PATH / database_config['NAME']}"
else:
    CONNECTION_STRING = f'postgresql://{database_config["USER"]}:{database_config["PASSWORD"]}' \
                        f'@{database_config["HOST"]}:{database_config["PORT"]}/{database_config["NAME"]}'

API_PREFIX = '/api'
API_VERSION_1_PREFIX = API_PREFIX + '/v1'
AUTH_ROUTER_PREFIX = '/auth'


class Tags(str, Enum):
    HOME = 'Home'
    V1 = 'V1'
    AUTH = 'Auth'


tags_metadata = [
    {'name': Tags.HOME, 'description': 'General information describing the API'},
    {'name': Tags.V1, 'description': 'API version 1'},
    {'name': Tags.AUTH, 'description': ''},
]


class RoleType(Enum):
    ADMIN = "admin"
    USER = "user"
