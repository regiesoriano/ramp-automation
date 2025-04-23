*** Settings ***
Library     OperatingSystem

*** Keywords ***
start browser instance
    [Arguments]  ${url}
    IF    "${BROWSER}" == "firefox"
        setup firefoxdriver
    ELSE
        setup chromedriver
    END
    #set selenium speed    0.5
    go to    ${url}

end browser instance
    close all browsers

setup chromedriver
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    log    HEADFUL=${HEADFUL} xvfb_running=${xvfb_running}
    IF    ${HEADFUL} and ${xvfb_running}
        call method    ${chrome_options}   add_argument    window-size\=1280,960
        call method    ${chrome_options}   add_argument    window-position\=0,0
    ELSE
        call method    ${chrome_options}   add_argument    headless
    END
    call method    ${chrome_options}   add_argument    disable-gpu
    call method    ${chrome_options}   add_argument    no-sandbox
    call method    ${chrome_options}   add_argument    disable-dev-shm-usage
    call method    ${chrome_options}   add_argument    remote-debugging-port\=9222
    ${options}=     call method     ${chrome_options}    to_capabilities
    ${chrome_options.desired_capabilities}=    set variable    ${options}
    #check existence of chromedriver from docker container. otherwise, fallback to local chromedriver
    ${chromedriver_exists}=    run process    /bin/ls /usr/bin/chromedriver    shell=yes
    IF    "${chromedriver_exists.stdout}" == "/usr/bin/chromedriver"
        set local variable    ${chromedriver}    /usr/bin/chromedriver
    ELSE
        set local variable    ${chromedriver}    ${EXECDIR}/chromedriver_linux
    END
    ${chrome_service}=    Evaluate    sys.modules['selenium.webdriver'].ChromeService()    sys, selenium.webdriver
    ${chrome_service.executable_path}=    set variable    ${chromedriver}
    create webdriver     Chrome     service=${chrome_service}    options=${chrome_options}

setup firefoxdriver
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    log    HEADFUL=${HEADFUL} xvfb_running=${xvfb_running}
    IF    ${HEADFUL} and ${xvfb_running}
        call method    ${firefox_options}   add_argument    --width\=1280
        call method    ${firefox_options}   add_argument    --height\=960
        call method    ${firefox_options}   add_argument    --disable-gpu
    ELSE
        call method    ${firefox_options}   add_argument    --headless
    END
    ${firefox_options.binary_location}=    set variable    /usr/bin/firefox
    ${firefox_service}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxService()    sys, selenium.webdriver
    #check existence of geckodriver from docker container. otherwise, fallback to local geckodriver
    ${geckodriver_exists}=    run process    /bin/ls /usr/bin/geckodriver    shell=yes
    IF    "${geckodriver_exists.stdout}" == "/usr/bin/geckodriver"
        set local variable    ${geckodriver}    /usr/bin/geckodriver
    ELSE
        set local variable    ${geckodriver}    ${EXECDIR}/geckodriver_linux
    END
    ${firefox_service.executable_path}=    set variable    ${geckodriver}
    create webdriver     Firefox    service=${firefox_service}    options=${firefox_options}