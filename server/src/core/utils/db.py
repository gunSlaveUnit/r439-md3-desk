import redis as redis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

from core.settings import CONNECTION_STRING, redis_config

engine = create_engine(CONNECTION_STRING)
local_session = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()


def get_db():
    db = local_session()
    try:
        yield db
    finally:
        db.close()


def get_session_storage():
    storage = redis.Redis(
        host=redis_config["HOST"],
        port=int(redis_config["PORT"]),
        db=redis_config["DB"]
    )
    try:
        yield storage
    finally:
        storage.quit()
