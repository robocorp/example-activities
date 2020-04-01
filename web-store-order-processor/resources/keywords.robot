*** Settings ***
Library     OperatingSystem
Library     Orders
Library     RPA.Browser
Variables   variables.py

*** Keyword ***
Process orders
    Validate prerequisites
    Open Swag Labs
    Wait Until Keyword Succeeds     3x  1s  Login   ${SWAG_LABS_USER_NAME}  ${SWAG_LABS_PASSWORD}
    ${orders}=                      Collect orders

    FOR     ${order}    IN  @{orders}
        Run Keyword And Continue On Failure     Process order   ${order}
    END

    [Teardown]                      Close Browser

*** Keyword ***
Validate prerequisites
    File Should Exist       ${EXCEL_FILE_PATH}
    Variable Should Exist   ${SWAG_LABS_USER_NAME}
    Should Not Be Empty     ${SWAG_LABS_USER_NAME}
    Variable Should Exist   ${SWAG_LABS_PASSWORD}
    Should Not Be Empty     ${SWAG_LABS_PASSWORD}

*** Keyword ***
Open Swag Labs
    Open Available Browser  ${SWAG_LABS_URL}

*** Keyword ***
Login
    [Arguments]         ${user_name}    ${password}
    Input Text          user-name       ${user_name}
    Input Password      password        ${password}
    Submit Form
    Assert logged in

*** Keyword ***
Assert logged in
    Location Should Be  ${SWAG_LABS_URL}/inventory.html

*** Keyword ***
Collect orders
    ${orders}=  Get orders          ${EXCEL_FILE_PATH}
    [Return]    ${orders}

*** Keyword ***
Process order
    [Arguments]                     ${order}
    Reset application state
    Open products page
    Assert cart is empty
    Wait Until Keyword Succeeds     3x  1s  Add product to cart     ${order}
    Wait Until Keyword Succeeds     3x  1s  Open cart
    Assert one product in cart      ${order}
    Checkout                        ${order}
    Open products page

*** Keyword ***
Reset application state
    Click Button                    css:.bm-burger-button button
    Wait Until Element Is Visible   id:reset_sidebar_link
    Click Link                      reset_sidebar_link

*** Keyword ***
Open products page
    Go To   ${SWAG_LABS_URL}/inventory.html

*** Keyword ***
Assert cart is empty
    Element Text Should Be              css:.shopping_cart_link     ${EMPTY}
    Page Should Not Contain Element     css:.shopping_cart_badge

*** Keyword ***
Add product to cart
    [Arguments]             ${order}
    ${product_name}=        Set Variable    ${order["item"]}
    ${locator}=             Set Variable    xpath://div[@class="inventory_item" and descendant::div[contains(text(), "${product_name}")]]
    ${product}=             Get WebElement  ${locator}
    ${add_to_cart_button}=  Set Variable    ${product.find_element_by_class_name("btn_primary")}
    Click Button            ${add_to_cart_button}
    Assert items in cart    1

*** Keyword ***
Assert items in cart
    [Arguments]             ${quantity}
    Element Text Should Be  css:.shopping_cart_badge    ${quantity}

*** Keyword ***
Open cart
    Click Link          css:.shopping_cart_link
    Assert cart page

*** Keyword ***
Assert cart page
    Location Should Be  ${SWAG_LABS_URL}/cart.html

*** Keyword ***
Assert one product in cart
    [Arguments]             ${order}
    Element Text Should Be  css:.cart_quantity          1
    Element Text Should Be  css:.inventory_item_name    ${order["item"]}

*** Keyword ***
Checkout
    [Arguments]                         ${order}
    Click Link                          css:.checkout_button
    Assert checkout information page
    Input Text                          first-name      ${order["first_name"]}
    Input Text                          last-name       ${order["last_name"]}
    Input Text                          postal-code     ${order["zip"]}
    Submit Form
    Assert checkout confirmation page   
    Click Link                          css:.btn_action
    Assert checkout complete page

*** Keyword ***
Assert checkout information page
    Location Should Be  ${SWAG_LABS_URL}/checkout-step-one.html

*** Keyword ***    
Assert checkout confirmation page
    Location Should Be  ${SWAG_LABS_URL}/checkout-step-two.html

*** Keyword ***
Assert checkout complete page
    Location Should Be  ${SWAG_LABS_URL}/checkout-complete.html
