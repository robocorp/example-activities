from robot.libraries.OperatingSystem import OperatingSystem

os = OperatingSystem()

# To make sure that the folders stay the same no matter the environment where we execute our robot, we
# will use the normalize_path function provided by the Operating System robotframework library.
EXCEL_FILE_PATH = os.normalize_path(__file__ + "/../../devdata/Data.xlsx")
PDF_TEMPLATE_PATH = os.normalize_path(
    __file__ + "/../../devdata/invite.template")
PDF_TEMP_OUTPUT_DIRECTORY = os.normalize_path(
    __file__ + "/../../output/pdf")
OUTPUT_DIRECTORY = os.normalize_path(
    __file__ + "/../../output")
