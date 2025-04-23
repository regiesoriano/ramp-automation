*** Settings ***
Library  SeleniumLibrary    run_on_failure=Nothing
Library  clipboard
Resource    ../page_objects/ramp_sign-up_objects.robot

*** Keywords ***
ramp sign-up url
    should not be empty    ${RAMP_SIGN_UP}

ramp sign-up page is opened
    wait until keyword succeeds    5x   1   ramp sign-up page is opened two
    capture page screenshot   embed

ramp sign-up page is opened two
    start browser instance    url=${RAMP_SIGN_UP}
    wait until element is visible    xpath=${sign_up_ramp_logo}   timeout=3
    wait until element is visible    xpath=${sign_up_start_application}   timeout=3

email field is populated
    [Arguments]    ${value}    ${mode}=input
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_up_email}
        press keys    ${sign_up_email}    CTRL+v

    ELSE
        input text    ${sign_up_email}    ${value}
    END
    click element    ${sign_up_background}
    capture page screenshot   embed

first name field is populated
    [Arguments]    ${value}    ${mode}=input
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_up_first_name}
        press keys    ${sign_up_first_name}    CTRL+v

    ELSE
        input text    ${sign_up_first_name}    ${value}
    END
    click element    ${sign_up_background}
    capture page screenshot   embed

last name field is populated
    [Arguments]    ${value}    ${mode}=input
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_up_last_name}
        press keys    ${sign_up_last_name}    CTRL+v

    ELSE
        input text    ${sign_up_last_name}    ${value}
    END
    click element    ${sign_up_background}
    capture page screenshot   embed

password field is populated
    [Arguments]    ${value}    ${mode}=input
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_up_password}
        press keys    ${sign_up_password}    CTRL+v

    ELSE
        input text    ${sign_up_password}    ${value}
    END
    click element    ${sign_up_background}
    capture page screenshot   embed

start application button is pressed
    click element    ${sign_up_start_application}

password field is copied
    [Arguments]    ${mode}=masked
    clipboard.copy    ${empty}
    IF  "${mode}" == "unmasked"
        click element    ${sign_up_password_tooltip_button}
    END
    click element    ${sign_up_password}
    press keys    none    CTRL+a
    sleep    1
    press keys    none    CTRL+c
    capture page screenshot   embed