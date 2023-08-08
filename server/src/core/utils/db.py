import redis as redis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

from core.settings import CONNECTION_STRING, redis_config

engine = create_engine(CONNECTION_STRING)
local_session = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()
