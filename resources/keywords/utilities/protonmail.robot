*** Keywords ***
open verify your ramp account email
    sleep    15
    go to    url=https://account.proton.me/mail
    wait until element is visible    xpath=//input[@id='username']    timeout=30
    input text    xpath=//input[@id='username']    regiesoriano
    input text    xpath=//input[@id='password']    Secur1ty!8888
    click element    xpath=//button[contains(text(),"Sign in")]
    wait until element is visible    xpath=//div[@class='searchbox flex pl-1']    timeout=30
    click element    xpath=//div[@class='searchbox flex pl-1']
    wait until element is visible    xpath=//input[@class='input-element w-full']    timeout=30
    input text    xpath=//input[@class='input-element w-full']    regiesoriano+0416e@proton.me your Ramp account
    click element    xpath=//button[contains(text(),"Search")]
    wait until element is visible    xpath=(//div[@class='item-container-wrapper relative'])[1]    timeout=30
    click element    xpath=(//div[@class='item-container-wrapper relative'])[1]

get mfa from email
    [Arguments]    ${email}
    sleep    15
    start browser instance    url=https://account.proton.me/mail
    wait until element is visible    xpath=//input[@id='username']    timeout=30
    input text    xpath=//input[@id='username']    regiesoriano
    input text    xpath=//input[@id='password']    Secur1ty!8888
    click element    xpath=//button[contains(text(),"Sign in")]
    wait until element is visible    xpath=//div[@class='searchbox flex pl-1']    timeout=30
    click element    xpath=//div[@class='searchbox flex pl-1']
    wait until element is visible    xpath=//input[@class='input-element w-full']    timeout=30
    input text    xpath=//input[@class='input-element w-full']    ${email} is your verification code
    click element    xpath=//button[contains(text(),"Search")]
    wait until element is visible    xpath=(//div[@class='item-container-wrapper relative'])[1]    timeout=30
    ${mfa}=    get text    xpath=(//div[@class='item-container-wrapper relative'])[1]
    ${mfa}=    split string    ${mfa}
    ${mfa}=    catenate    ${mfa}[4]
    set test variable    ${mfa}
    close window
    switch browser    1