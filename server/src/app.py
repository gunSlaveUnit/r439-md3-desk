from fastapi import FastAPI

from core.settings import DEBUG
from server.src.api.v1.api import router as api_v1_router

app = FastAPI(debug=DEBUG)

app.include_router(api_v1_router)
