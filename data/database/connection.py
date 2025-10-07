class DatabaseConnection(type):
    _instances = {}
    def __call__(cls, *args, **kwds):
        if cls not in cls._instances:
            instance = super().__call__( *args, **kwds)
            cls._instances[cls] = instance
        return cls._instances[cls]
    
class Database(DatabaseConnection):
    def __init__(self, sql_connection_string: str):
        self.connect = sql_connection_string
