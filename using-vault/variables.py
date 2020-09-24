from RPA.Robocloud.Secrets import Secrets

secrets = Secrets()
USER_NAME = secrets.get_secret("credentials")["username"]
PASSWORD = secrets.get_secret("credentials")["password"]
