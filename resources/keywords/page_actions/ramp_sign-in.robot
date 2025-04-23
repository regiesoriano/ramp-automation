*** Settings ***
Library  SeleniumLibrary    run_on_failure=Nothing
Library  clipboard
Resource    ../page_objects/ramp_sign-in_objects.robot

*** Keywords ***
ramp sign-in url
    should not be empty    ${RAMP_SIGN_IN}

ramp sign-in page is opened
    wait until keyword succeeds    5x   1   ramp sign-in page is opened two
    capture page screenshot   embed

ramp sign-in page is opened two
    start browser instance    url=${RAMP_SIGN_IN}
    wait until element is visible    xpath=${sign_in_ramp_logo}   timeout=3
    wait until element is visible    xpath=${sign_in_continue}   timeout=3

sign in email field is populated
    [Arguments]    ${value}    ${mode}=input
    wait until element is visible    xpath=${sign_in_email}   timeout=5
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_in_email}
        press keys    ${sign_in_email}    CTRL+v

    ELSE
        input text    ${sign_in_email}    ${value}
    END
    click element    ${sign_in_background}
    capture page screenshot   embed

sign in password field is populated
    [Arguments]    ${value}    ${mode}=input
    wait until element is visible    xpath=${sign_in_sign_in_to_ramp}   timeout=30
    ${is_sign_in_with_password_visible}=    run keyword and return status    element should be visible   ${sign_in_sign_in_with_password_link}
    IF    "${is_sign_in_with_password_visible}" == "True"
        click element    ${sign_in_sign_in_with_password_link}
    END
    wait until element is visible    xpath=${sign_in_password}   timeout=30
    IF  "${mode}" == "clipboard"
        clipboard.copy    ${value}
        click element    ${sign_in_password}
        press keys    ${sign_in_password}    CTRL+v

    ELSE
        click element    ${sign_in_password}
        press keys    ${sign_in_password}    ${value}
        #input text    ${sign_in_password}    ${value}
    END
    click element    ${sign_in_background}
    capture page screenshot   embed

sign in mfa field is populated
    wait until element is visible    xpath=${sign_in_mfa}   timeout=5
    click element    ${sign_in_mfa}
    press keys    ${sign_in_mfa}    ${mfa}
    #input text    ${sign_in_password}    ${value}
    click element    ${sign_in_background}
    capture page screenshot   embed

sign in password field is copied
    [Arguments]    ${mode}=masked
    clipboard.copy    ${empty}
    IF  "${mode}" == "unmasked"
        click element    ${sign_in_password_tooltip_button}
    END
    click element    ${sign_in_password}
    press keys    none    CTRL+a
    sleep    1
    press keys    none    CTRL+c
    capture page screenshot   embed

continue button is pressed
    click element    ${sign_in_continue}

sign in to ramp button is pressed
    [Arguments]    ${count}=1
    FOR    ${i}    IN RANGE    ${count}
        wait until element is visible    xpath=${sign_in_sign_in_to_ramp}   timeout=5
        click element    ${sign_in_sign_in_to_ramp}
    END
    