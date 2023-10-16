from src.models.users import Token, User
from src.schemas.users import UserCreate

from .base import RepositoryDBToken, RepositoryDBUser


class RepositoryUsers(RepositoryDBUser[User, UserCreate]):
    pass


user_crud = RepositoryUsers(User)
token_crud = RepositoryDBToken(Token)
