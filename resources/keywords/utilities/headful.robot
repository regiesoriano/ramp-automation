*** Keywords ***
identify platform
    #use platform.system() to identify platform
    ${system}=    Evaluate    platform.system()    platform
    [Return]    ${system}
    IF    "${system}" != "Linux"
        #revert value of global variable ${HEADFUL} if not running on Linux
        set global variable    ${HEADFUL}    False
        log    Running headful on non-Linux system! This is not supported yet, reverting to headless.    warn
    END

start virtual display
    identify platform
    IF    ${HEADFUL}
        #temporary implementation of installing dependencies. ideally, this should be done through the dockerfile (qa-automation)
        #run process    /usr/bin/apt update     shell=yes
        #run process    /usr/bin/apt install -y x11vnc xvfb fluxbox scrot     shell=yes
        #set system-wide environment variable
        #set environment variable    DISPLAY    ${DISPLAY}
        #start virtual display
        ${xvfb}    start process    /usr/bin/Xvfb ${DISPLAY} -screen 0 1280x960x16    shell=yes
        #start vnc server
        ${vnc}    start process    /usr/bin/x11vnc -display WAIT${DISPLAY} -bg -forever -reopen -nopw -quiet    shell=yes
        #check virtual display process status. browser will revert to headless mode if xvfb is not running
        sleep    3
        ${xvfb_running}=    is process running
        set suite variable    ${xvfb_running}
	END

stop virtual display
    IF    ${HEADFUL}
        log     Headful test runs are designed for debugging purposes. Ideally, we would not want to do teardown on virtual display processes so lines below are commented by default.
        #stop virtual display and vnc server
        #run process    /usr/bin/pkill -f Xvfb    shell=yes
        #run process    /usr/bin/pkill -f x11vnc    shell=yes
	END

headful screenshot
    IF    ${HEADFUL}
        sleep    5
        take screenshot
    END