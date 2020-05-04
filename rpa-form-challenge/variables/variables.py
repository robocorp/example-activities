from robot.libraries.OperatingSystem import OperatingSystem

os = OperatingSystem()

# To make sure that the folders stay the same no matter the environment where we execute our robot, we
# will use the normalize_path function provided by the Operating System robotframework library.

EXCEL_FILE_URL = 'http://rpachallenge.com/assets/downloadFiles/challenge.xlsx'
EXCEL_FILE_LOCAL_DOWNLOAD_PATH = os.normalize_path(__file__ + "/../../output/challenge.xlsx")
RPA_CHALLENGE_URL = 'http://rpachallenge.com/'
