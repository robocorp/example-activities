# ## Web store order robot example
# This example is explained in detail <a href="https://robocorp.com/docs/development-howtos/browser/web-store-order-robot">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the <a href="https://robocorp.com/docs/development-howtos/browser/web-store-order-robot">example page</a> for details!**
#

*** Settings ***
Documentation     Swag order robot. Places orders at https://www.saucedemo.com/
...               by processing a spreadsheet of orders and ordering the
...               specified products using browser automation. Uses local or
...               cloud vault for credentials.
Library           OperatingSystem
Library           Orders
Library           RPA.Browser
Library           RPA.HTTP
Library           RPA.Robocloud.Secrets

*** Variables ***
${EXCEL_FILE_NAME}=    Data.xlsx
${EXCEL_FILE_URL}=    https://github.com/robocorp/example-activities/raw/master/web-store-order-processor/devdata/${EXCEL_FILE_NAME}
${SWAG_LABS_URL}=    https://www.saucedemo.com

*** Keywords ***
Process orders
    Open Swag Labs
    ${secret}=    Get Secret    swaglabs
    Wait Until Keyword Succeeds    3x    1s    Login    ${secret}[username]    ${secret}[password]
    ${orders}=    Collect orders
    FOR    ${order}    IN    @{orders}
        Run Keyword And Continue On Failure    Process order    ${order}
    END
    [Teardown]    Close Browser

*** Keywords ***
Open Swag Labs
    Open Available Browser    ${SWAG_LABS_URL}

*** Keywords ***
Login
    [Arguments]    ${user_name}    ${password}
    Input Text    user-name    ${user_name}
    Input Password    password    ${password}
    Submit Form
    Assert logged in

*** Keywords ***
Assert logged in
    Wait Until Page Contains Element    inventory_container
    Location Should Be    ${SWAG_LABS_URL}/inventory.html

*** Keywords ***
Collect orders
    Download    ${EXCEL_FILE_URL}    overwrite=True
    ${orders}=    Get orders    ${EXCEL_FILE_NAME}
    [Return]    ${orders}

*** Keywords ***
Process order
    [Arguments]    ${order}
    Reset application state
    Open products page
    Assert cart is empty
    Wait Until Keyword Succeeds    3x    1s    Add product to cart    ${order}
    Wait Until Keyword Succeeds    3x    1s    Open cart
    Assert one product in cart    ${order}
    Checkout    ${order}
    Open products page

*** Keywords ***
Reset application state
    Click Button    css:.bm-burger-button button
    Click Element When Visible    id:reset_sidebar_link

*** Keywords ***
Open products page
    Go To    ${SWAG_LABS_URL}/inventory.html

*** Keywords ***
Assert cart is empty
    Element Text Should Be    css:.shopping_cart_link    ${EMPTY}
    Page Should Not Contain Element    css:.shopping_cart_badge

*** Keywords ***
Add product to cart
    [Arguments]    ${order}
    ${product_name}=    Set Variable    ${order["item"]}
    ${locator}=    Set Variable    xpath://div[@class="inventory_item" and descendant::div[contains(text(), "${product_name}")]]
    ${product}=    Get WebElement    ${locator}
    ${add_to_cart_button}=    Set Variable    ${product.find_element_by_class_name("btn_primary")}
    Click Button    ${add_to_cart_button}
    Assert items in cart    1

*** Keywords ***
Assert items in cart
    [Arguments]    ${quantity}
    Element Text Should Be    css:.shopping_cart_badge    ${quantity}

*** Keywords ***
Open cart
    Click Link    css:.shopping_cart_link
    Assert cart page

*** Keywords ***
Assert cart page
    Wait Until Page Contains Element    cart_contents_container
    Location Should Be    ${SWAG_LABS_URL}/cart.html

*** Keywords ***
Assert one product in cart
    [Arguments]    ${order}
    Element Text Should Be    css:.cart_quantity    1
    Element Text Should Be    css:.inventory_item_name    ${order["item"]}

*** Keywords ***
Checkout
    [Arguments]    ${order}
    Click Link    css:.checkout_button
    Assert checkout information page
    Input Text    first-name    ${order["first_name"]}
    Input Text    last-name    ${order["last_name"]}
    Input Text    postal-code    ${order["zip"]}
    Submit Form
    Assert checkout confirmation page
    Click Element When Visible    css:.btn_action
    Assert checkout complete page

*** Keywords ***
Assert checkout information page
    Wait Until Page Contains Element    checkout_info_container
    Location Should Be    ${SWAG_LABS_URL}/checkout-step-one.html

*** Keywords ***
Assert checkout confirmation page
    Wait Until Page Contains Element    checkout_summary_container
    Location Should Be    ${SWAG_LABS_URL}/checkout-step-two.html

*** Keywords ***
Assert checkout complete page
    Wait Until Page Contains Element    checkout_complete_container
    Location Should Be    ${SWAG_LABS_URL}/checkout-complete.html

*** Tasks ***
Place orders
    Process orders
