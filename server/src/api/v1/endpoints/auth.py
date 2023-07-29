from fastapi import APIRouter

from core.settings import AUTH_ROUTER_PREFIX, Tags

router = APIRouter(prefix=AUTH_ROUTER_PREFIX, tags=[Tags.AUTH])


@router.post('/sign-up/')
async def sign_up():
    """Registration (creation of a new user).
    Login immediately.
    """


@router.post('/sign-in/')
async def sign_in():
    """"""


@router.post('/sign-out/')
async def sign_out():
    """Deletes a user session."""


@router.get('/me/')
async def me():
    pass
