*** Settings ***
Resource    ../resource_collection.robot
Suite Setup    start virtual display
Suite Teardown    stop virtual display
Force Tags    regie

*** Test Cases ***
Ramp Sign-Up page should contain required elements
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    THEN ramp logo should be visible
    AND apply for ramp heading should be visible
    AND work email address field should be visible
    AND first name field should be visible
    AND last name field should be visible
    AND password field should be visible
    AND work email address tooltip should be visible
    AND first name tooltip should be visible
    AND last name tooltip should be visible
    AND password tooltip should be visible
    AND start application button should be visible
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be editable
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    THEN field work email address should contain text    email@test.net
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be editable - clipboard
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    mode=clipboard    value=email@test.net
    THEN field work email address should contain text    email@test.net
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is aplhabet
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is aplhanumeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email123@test.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is numeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=123@321.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is uppercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=EMAIL@TEST.NET
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is lowercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@test.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is mixed case
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=EmaiL@TeSt.nEt
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value contains valid special characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email.email_e-mail%email/email+email@test.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - <>
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em<a>il@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - []
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em[a]il@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - ,
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em,ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - ;
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em;ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - :
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em:ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - \\
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em\\ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - "
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em"a"il@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value does not contain @ symbol
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=emailtest.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains double @ symbol
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains dot at the beginning
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=.email@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    AND email field is populated    value=email.@test.net
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains dot at the end
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email.@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains consecutive dots
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em..ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value uses invalid domain - gmail
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@gmail.com
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value uses invalid domain - yahoo
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@yahoo.com
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value uses invalid domain - hotmail
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@hotmail.com
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid spaces
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em ail@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains invalid special characters - ()
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=em(a)il@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value contains emoji
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email😂@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value exceeds character limit - 65 local
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=emaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil@test.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value exceeds character limit - 191 domain
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=email@teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest.net
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed valid when value is within character limit - 64 local 190 domain 254 total
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=emaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil@teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest.net
    AND start application button is pressed
    THEN field work email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Work email address field should be deemed invalid when value is blank
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND email field is populated    value=
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be editable
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=testfirstname
    THEN field first name should contain text    testfirstname
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be editable - clipboard
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    mode=clipboard    value=testfirstname
    THEN field first name should contain text    testfirstname
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value is aplhabet
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstname
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value is uppercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=TEST FIRSTNAME
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value is lowercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstname
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value is mixed case
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=Test FirstName
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value contains valid special characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=Test-First'Name
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value is aplhanumeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstname123
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value is numeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=123
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - `
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test`firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ~
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test~firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - !
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstname!
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - @
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test@firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - #
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test#firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - $
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test fir$tname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - %
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test%firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ^
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test^firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - &
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test&firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - *
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test*firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ()
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test(first)name
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - _
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test_firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - +
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test+firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - =
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test=firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - {}
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test{first}name
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - []
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test[first]name
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - |
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test|firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - \\
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test\\firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - :
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test:firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ;
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test;firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - "
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test"firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - <>
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test<first>name
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ,
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test,firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - .
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test.firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - ?
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test?firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains invalid special characters - /
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test/firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value contains emoji
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test😂firstname
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value exceeds character limit - 41
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstnaaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed valid when value is within character limit - 40
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=test firstnaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND start application button is pressed
    THEN field first name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page First name field should be deemed invalid when value is blank
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND first name field is populated    value=
    AND start application button is pressed
    THEN field first name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be editable
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=testlastname
    THEN field last name should contain text    testlastname
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be editable - clipboard
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    mode=clipboard    value=testlastname
    THEN field last name should contain text    testlastname
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value is aplhabet
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastname
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value is uppercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=TEST LASTNAME
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value is lowercase
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastname
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value is mixed case
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=Test LastName
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value contains valid special characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=Test-Last'Name
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value is aplhanumeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastname123
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value is numeric
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=123
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - `
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test`lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ~
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test~lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - !
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastname!
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - @
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test@lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - #
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test#lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - $
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test fir$tname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - %
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test%lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ^
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test^lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - &
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test&lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - *
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test*lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ()
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test(last)name
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - _
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test_lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - +
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test+lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - =
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test=lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - {}
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test{last}name
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - []
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test[last]name
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - |
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test|lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - \\
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test\\lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - :
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test:lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ;
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test;lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - "
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test"lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - <>
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test<last>name
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ,
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test,lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - .
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test.lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - ?
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test?lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains invalid special characters - /
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test/lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value contains emoji
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test😂lastname
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value exceeds character limit - 41
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastnaaaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed valid when value is within character limit - 40
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=test lastnaaaaaaaaaaaaaaaaaaaaaaaaaaaame
    AND start application button is pressed
    THEN field last name should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page Last name field should be deemed invalid when value is blank
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND last name field is populated    value=
    AND start application button is pressed
    THEN field last name should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be editable
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=testpassword
    THEN field password should contain text    testpassword
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be editable - clipboard
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    mode=clipboard    value=testpassword
    THEN field password should contain text    testpassword
    [Teardown]    end browser instance

Ramp Sign-Up page password field should not be copiable when masked
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestP@ssword123
    AND password field is copied
    THEN password should not be copied to clipboard
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be copiable when unmasked
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestP@ssword123
    AND password field is copied    mode=unmasked
    THEN password should be copied to clipboard    TestP@ssword123
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed valid when value meets complexity requirement
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestP@ssword123
    AND start application button is pressed
    THEN field password should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed valid when value contains emoji
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestP@ssword123😂
    AND start application button is pressed
    THEN field password should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid when less than 12 characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=P@ssword123
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid when no lowercase characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TESTP@SSWORD123
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid when no uppercase characters
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=testp@ssword123
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid when no numbers
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestP@ssword
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid when value is commonly used
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=TestPassword123!
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page password field should be deemed invalid due to multiple reasons
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND password field is populated    value=password
    AND start application button is pressed
    THEN field password should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-Up page Start application button should be always enabled
    GIVEN ramp sign-up url
    WHEN ramp sign-up page is opened
    AND start application button is pressed
    THEN field work email address should be deemed invalid
    AND field first name should be deemed invalid
    AND field last name should be deemed invalid
    AND field password should be deemed invalid
    [Teardown]    end browser instance