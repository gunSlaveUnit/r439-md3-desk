from fastapi import APIRouter

from core.settings import API_VERSION_1_PREFIX, Tags
from server.src.api.v1.endpoints.auth import router as auth_router

router = APIRouter(prefix=API_VERSION_1_PREFIX, tags=[Tags.V1])

router.include_router(auth_router)
