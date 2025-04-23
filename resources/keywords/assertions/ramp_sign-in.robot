*** Keywords ***
sign in ramp logo should be visible
    wait until element is visible    xpath=${sign_in_ramp_logo}   timeout=30

welcome to ramp heading should be visible
    wait until element is visible    xpath=${sign_in_welcome_heading}   timeout=30

sign in email address field should be visible
    wait until element is visible    xpath=${sign_in_email}   timeout=30

continue button should be visible
    wait until element is visible    xpath=${sign_in_continue}   timeout=30

sign in to ramp button should be visible
    wait until element is visible    xpath=${sign_in_sign_in_to_ramp}   timeout=30

sign up footer should be visible
    wait until element is visible    xpath=${sign_in_sign_up_footer}   timeout=30

sign in password field should be visible
    wait until element is visible    xpath=${sign_in_password}   timeout=30

use a different email link should be visible
    wait until element is visible    xpath=${sign_in_use_a_different_email_link}   timeout=30

reset password link should be visible
    wait until element is visible    xpath=${sign_in_reset_password_link}   timeout=30

sign in with google button should be visible
    wait until element is visible    xpath=${sign_in_sign_in_with_google_button}   timeout=30

sign in password tooltip should be visible
    mouse over    xpath=${sign_in_password_tooltip_button}
    wait until element is visible    xpath=${sign_in_password_tooltip_text}   timeout=30

sign in field ${field} should contain text
    [Arguments]    ${text}
    IF  "${field}" == "email address"
        ${locator}=    set variable    ${sign_in_email}
    ELSE IF  "${field}" == "password"
        ${locator}=    set variable    ${sign_in_password}
        click element    ${sign_in_password_tooltip_button}
    END
    ${value}    get element attribute   xpath=${locator}    value
    should be equal as strings    ${text}    ${value}

sign in field email address should be deemed ${status}
    ${locator}=    set variable    ${sign_in_email_valid_indicator}
    click element    ${sign_in_email}
    capture page screenshot   embed
    IF  "${status}" == "valid"
        #page should contain element   xpath=${locator}
        wait until element is visible    xpath=${locator}   timeout=30
    ELSE IF  "${status}" == "invalid"
        page should not contain element   xpath=${locator}
        wait until element is not visible    xpath=${locator}   timeout=30
    END

sign in field password should be deemed ${status}
    ${locator}=    set variable    ${sign_in_password_invalid_indicator}
    click element    ${sign_in_password}
    capture page screenshot   embed
    IF  "${status}" == "valid"
        page should not contain element   xpath=${locator}
        wait until element is not visible    xpath=${locator}   timeout=30
    ELSE IF  "${status}" == "invalid"
        #page should contain element   xpath=${locator}
        wait until element is visible    xpath=${locator}   timeout=30
    END

sign in credentials should be deemed invalid
    capture page screenshot   embed
    wait until element is visible    xpath=${sign_in_email_password_invalid_indicator}   timeout=30

sign in password should not be copied to clipboard
    ${clipboard_value}    clipboard.paste
    should be empty    ${clipboard_value}

sign in password should be copied to clipboard
    [Arguments]    ${value}
    ${clipboard_value}    clipboard.paste
    should be equal as strings    ${clipboard_value}    ${value}

user should be redirected to mfa page
    wait until location is    https://app.ramp.com/sign-in/mfa   timeout=30

user should be signed in successfully
    wait until location is    https://app.ramp.com/application   timeout=30

too many failed login attempts error should be displayed
    capture page screenshot   embed
    wait until element is visible    xpath=${sign_in_email_password_invalid_indicator}   timeout=30