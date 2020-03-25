from RPA.Robocloud.Secrets import Secrets

EXCEL_FILE_PATH = __file__ + "/../../devdata/Data.xlsx"
SWAG_LABS_URL = "https://www.saucedemo.com"

secrets = Secrets()
SWAG_LABS_USER_NAME = secrets.get_secret("swaglabs")["username"]
SWAG_LABS_PASSWORD = secrets.get_secret("swaglabs")["password"]
