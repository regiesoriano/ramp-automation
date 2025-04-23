*** Settings ***
Resource    ../resource_collection.robot
Suite Setup    start virtual display
Suite Teardown    stop virtual display
Force Tags    regie

*** Test Cases ***
Ramp Sign-Up page should be redirected WHEN valid details are used
    [Setup]    a valid email address
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=${random_email}
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should be redirected to verify email page
    AND user should receive verify your ramp account email
    [Teardown]    end browser instance

Ramp Sign-Up page should not be redirected WHEN invalid details are used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@gmail.com
    AND first name field is populated    value=test firstnaaaaaaaaaaaaaaaaaaaaaaaaaaaamefirstname
    AND last name field is populated    value=test lastnaaaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND password field is populated    value=password
    AND start application button is pressed
    THEN user should stay on the sign-up page
    [Teardown]    end browser instance

Ramp Sign-Up page should not be redirected WHEN invalid email is used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@gmail.com
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should stay on the sign-up page
    [Teardown]    end browser instance

Ramp Sign-Up page should not be redirected WHEN invalid first name is used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    AND first name field is populated    value=test firstnaaaaaaaaaaaaaaaaaaaaaaaaaaaamefirstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should stay on the sign-up page
    [Teardown]    end browser instance

Ramp Sign-Up page should not be redirected WHEN invalid last name is used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastnaaaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should stay on the sign-up page
    [Teardown]    end browser instance

Ramp Sign-Up page should not be redirected WHEN invalid password is used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=password
    AND start application button is pressed
    THEN user should stay on the sign-up page
    [Teardown]    end browser instance

Ramp Sign-Up page should be redirected to Sign-In WHEN email is already registered - verified
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=regiesoriano+verified@proton.me
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should be redirected to sign in page
    [Teardown]    end browser instance

Ramp Sign-Up page should be redirected to Sign-In WHEN email is already registered - unverified
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=regiesoriano+unverified@proton.me
    AND first name field is populated    value=test firstname
    AND last name field is populated    value=test lastname
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN user should be redirected to sign in page
    [Teardown]    end browser instance