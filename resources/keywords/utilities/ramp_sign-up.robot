*** Keywords ***
a valid email address
    [Arguments]    ${length}=5
    ${random_string}=    generate random string    ${length}    [LETTERS]
    ${random_email}=    catenate    aregiesoriano+${random_string}@proton.meee
    set suite variable    ${random_email}