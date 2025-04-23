*** Keywords ***
ramp logo should be visible
    wait until element is visible    xpath=${sign_up_ramp_logo}   timeout=30

apply for ramp heading should be visible
    wait until element is visible    xpath=${sign_up_apply_heading}   timeout=30

work email address field should be visible
    click element    xpath=${sign_up_email}
    wait until element is visible    xpath=${sign_up_email}   timeout=30

first name field should be visible
    click element    xpath=${sign_up_first_name}
    wait until element is visible    xpath=${sign_up_first_name}   timeout=30

last name field should be visible
    click element    xpath=${sign_up_last_name}
    wait until element is visible    xpath=${sign_up_last_name}   timeout=30

password field should be visible
    click element    xpath=${sign_up_password}
    wait until element is visible    xpath=${sign_up_password}   timeout=30

work email address tooltip should be visible
    mouse over    xpath=${sign_up_email_tooltip_button}
    wait until element is visible    xpath=${sign_up_email_tooltip_text}   timeout=30

first name tooltip should be visible
    mouse over    xpath=${sign_up_first_name_tooltip_button}
    wait until element is visible    xpath=${sign_up_first_name_tooltip_text}   timeout=30

last name tooltip should be visible
    mouse over    xpath=${sign_up_last_name_tooltip_button}
    wait until element is visible    xpath=${sign_up_last_name_tooltip_text}   timeout=30

password tooltip should be visible
    mouse over    xpath=${sign_up_password_tooltip_button}
    wait until element is visible    xpath=${sign_up_password_tooltip_text}   timeout=30

password complexity indicator should be visible
    wait until element is visible    xpath=${sign_up_password_complexity_indicator}   timeout=30

start application button should be visible
    wait until element is visible    xpath=${sign_up_start_application}   timeout=30

field ${field} should contain text
    [Arguments]    ${text}
    IF  "${field}" == "work email address"
        ${locator}=    set variable    ${sign_up_email}
    ELSE IF  "${field}" == "first name"
        ${locator}=    set variable    ${sign_up_first_name}
    ELSE IF  "${field}" == "last name"
        ${locator}=    set variable    ${sign_up_last_name}
    ELSE IF  "${field}" == "password"
        ${locator}=    set variable    ${sign_up_password}
        click element    ${sign_up_password_tooltip_button}
    END
    ${value}    get element attribute   xpath=${locator}    value
    should be equal as strings    ${text}    ${value}

field ${field} should be deemed ${status}
    IF  "${field}" == "work email address"
        ${locator}=    set variable    ${sign_up_email_invalid_indicator}
    ELSE IF  "${field}" == "first name"
        ${locator}=    set variable    ${sign_up_first_name_invalid_indicator}
    ELSE IF  "${field}" == "last name"
        ${locator}=    set variable    ${sign_up_last_name_invalid_indicator}
    ELSE IF  "${field}" == "password"
        ${locator}=    set variable    ${sign_up_password_invalid_indicator}
        click element    ${sign_up_password_tooltip_button}
        sleep    10
    END
    IF  "${status}" == "valid"
        page should not contain element   xpath=${locator}
    ELSE IF  "${status}" == "invalid"
        page should contain element   xpath=${locator}
    END
    capture page screenshot   embed

password should not be copied to clipboard
    ${clipboard_value}    clipboard.paste
    should be empty    ${clipboard_value}

password should be copied to clipboard
    [Arguments]    ${value}
    ${clipboard_value}    clipboard.paste
    should be equal as strings    ${clipboard_value}    ${value}

user should stay on the sign-up page
    location should be    https://app.ramp.com/sign-up

user should be redirected to verify email page
    wait until location is    https://app.ramp.com/verify-email   timeout=30

user should receive verify your ramp account email
    wait until keyword succeeds    3x   1   open verify your ramp account email
    sleep    3
    page should contain    Verify your Ramp account

user should be redirected to sign in page
    wait until location is    https://app.ramp.com/sign-in   timeout=30