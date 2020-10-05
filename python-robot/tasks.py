from RPA.Browser import Browser

browser = Browser()
url = "https://robocorp.com/docs/"
term = "python"
screenshot_filename = "output/screenshot.png"


def open_the_website(url: str):
    browser.open_available_browser(url)


def search_for(term: str):
    input = "css:input"
    browser.input_text(input, "python")
    browser.press_keys(input, "ENTER")


def store_screenshot(filename: str):
    browser.screenshot(filename=filename)


def task():
    try:
        open_the_website(url)
        search_for(term)
        store_screenshot(screenshot_filename)
    finally:
        browser.close_all_browsers()


task()
