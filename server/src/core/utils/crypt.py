from passlib.context import CryptContext

crypt_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def get_password_hash(password):
    return crypt_context.hash(password)


def verify_password(plain_password, hashed_password):
    return crypt_context.verify(plain_password, hashed_password)
