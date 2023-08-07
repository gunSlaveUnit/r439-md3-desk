from pathlib import Path

APP_ID = 'VUC.ISPU.R439-MD3'

ROOT_PATH = Path(__file__).parent.parent
RESOURCES_PATH = ROOT_PATH / 'resources'
SRC_PATH = ROOT_PATH / 'src'
GUI_LAYOUTS_PATH = SRC_PATH / 'gui'

API_VERSION = 1

SERVER_URL = f"http://127.0.0.1:8000/api/v{API_VERSION}/"
AUTH_URL = SERVER_URL + "auth/"
REGISTER_URL = AUTH_URL + "sign-up/"
LOGIN_URL = AUTH_URL + "sign-in/"
LOGOUT_URL = AUTH_URL + "sign-out/"
ME_URL = AUTH_URL + "me/"
