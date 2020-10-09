from RPA.Browser import Browser

browser = Browser()
url = "https://robocorp.com/docs/"
term = "python"
screenshot_filename = "output/screenshot.png"


def open_the_website(url: str):
    browser.open_available_browser(url)


def search_for(term: str):
    input_field = "css:input"
    browser.input_text(input_field, term)
    browser.press_keys(input_field, "ENTER")


def store_screenshot(filename: str):
    browser.screenshot(filename=filename)


# Define a main() function that calls the other functions in order:
def main():
    try:
        open_the_website(url)
        search_for(term)
        store_screenshot(screenshot_filename)
    finally:
        browser.close_all_browsers()


# Call the main() function, checking that we are running as a stand-alone script:
if __name__ == "__main__":
    main()
