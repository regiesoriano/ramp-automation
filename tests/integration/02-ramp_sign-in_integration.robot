*** Settings ***
Resource    ../resource_collection.robot
Suite Setup    start virtual display
Suite Teardown    stop virtual display
Force Tags    regie

*** Test Cases ***
Ramp Sign-In page should be redirected WHEN valid details are used - verified
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=regiesoriano+verified@proton.me
    AND continue button is pressed
    AND sign in password field is populated    value=TestP@ssword123
    AND sign in to ramp button is pressed
    AND user should be redirected to mfa page
    AND get mfa from email    email=regiesoriano+verified@proton.me
    AND sign in mfa field is populated
    THEN user should be signed in successfully
    [Teardown]    end browser instance

Ramp Sign-In page should be redirected WHEN valid details are used - unverified
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=regiesoriano+unverified@proton.me
    AND continue button is pressed
    AND sign in password field is populated    value=TestP@ssword123
    AND sign in to ramp button is pressed
    AND user should be redirected to mfa page
    AND get mfa from email    email=regiesoriano+unverified@proton.me
    AND sign in mfa field is populated
    THEN user should be signed in successfully
    [Teardown]    end browser instance

Ramp Sign-In page should be redirected WHEN unregistered credentials are used
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=regiesoriano+unregistered@proton.me
    AND continue button is pressed
    AND sign in password field is populated    value=TestP@ssword123
    AND sign in to ramp button is pressed
    THEN sign in credentials should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page should be redirected WHEN incorrect password is used
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=regiesoriano+unverified@proton.me
    AND continue button is pressed
    AND sign in password field is populated    value=WrongTestP@ssword123
    AND sign in to ramp button is pressed
    THEN sign in credentials should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page should be redirected WHEN incorrect password is used - too many attempts
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=regiesoriano+unverified@proton.me
    AND continue button is pressed
    AND sign in password field is populated    value=WrongTestP@ssword123
    AND sign in to ramp button is pressed    count=6
    THEN too many failed login attempts error should be displayed
    [Teardown]    end browser instance