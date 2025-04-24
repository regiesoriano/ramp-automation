*** Settings ***
Resource    ../resource_collection.robot
Suite Setup    start virtual display
Suite Teardown    stop virtual display
Force Tags    regie

*** Test Cases ***
Ramp Sign-In page should contain required elements
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    THEN sign in ramp logo should be visible
    AND welcome to ramp heading should be visible
    AND sign in email address field should be visible
    AND continue button should be visible
    AND sign up footer should be visible
    [Teardown]    end browser instance

Ramp Sign-In page should contain required elements - email populated
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    THEN sign in ramp logo should be visible
    AND welcome to ramp heading should be visible
    AND sign in email address field should be visible
    AND sign in password field should be visible
    AND use a different email link should be visible
    AND reset password link should be visible
    AND sign in to ramp button should be visible
    AND sign in with google button should be visible
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be editable
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    THEN sign in field email address should contain text    email@test.net
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be editable - clipboard
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    mode=clipboard    value=email@test.net
    THEN sign in field email address should contain text    email@test.net
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is aplhabet
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is aplhanumeric
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email123@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is numeric
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=123@321.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is uppercase
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=EMAIL@TEST.NET
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is lowercase
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is mixed case
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=EmaiL@TeSt.nEt
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value contains valid special characters
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email.email_e-mail%email/email+email@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - ()
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em(a)il@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - <>
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em<a>il@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - []
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em[a]il@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - ,
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em,ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - ;
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em;ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - :
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em:ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - \\
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em\\ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid special characters - "
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em"a"il@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value does not contain @ symbol
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=emailtest.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains double @ symbol
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains dot at the beginning
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=.email@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    AND sign in email field is populated    value=email.@test.net
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains dot at the end
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email.@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains consecutive dots
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em..ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains invalid spaces
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=em ail@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value contains emoji
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email😂@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value exceeds character limit - 65 local 256 domain 322 total
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=emaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil@teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value exceeds character limit - 65 local
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=emaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil@test.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value exceeds character limit - 256 domain
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest.net
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed valid when value is within character limit - 64 local 255 domain 320 total
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=emaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil@teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest.net
    AND continue button is pressed
    THEN sign in field email address should be deemed valid
    [Teardown]    end browser instance

Ramp Sign-In page Email address field should be deemed invalid when value is blank
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page password field should be editable
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    AND sign in password field is populated    value=testpassword
    THEN field password should contain text    testpassword
    [Teardown]    end browser instance

Ramp Sign-In page password field should be editable - clipboard
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    AND sign in password field is populated    mode=clipboard    value=testpassword
    THEN field password should contain text    testpassword
    [Teardown]    end browser instance

Ramp Sign-In page password field should not be copiable when masked
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    AND sign in password field is populated    value=TestP@ssword123
    AND sign in password field is copied
    THEN sign in password should not be copied to clipboard
    [Teardown]    end browser instance

Ramp Sign-In page password field should be copiable when unmasked
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    AND sign in password field is populated    value=TestP@ssword123
    AND sign in password field is copied    mode=unmasked
    THEN sign in password should be copied to clipboard    TestP@ssword123

Ramp Sign-In page Continue button should be always enabled
    [Tags]    regieee
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND continue button is pressed
    THEN sign in field email address should be deemed invalid
    [Teardown]    end browser instance

Ramp Sign-In page Sign in to Ramp button should be always enabled
    [Tags]    regieee
    GIVEN ramp sign-in url
    WHEN ramp sign-in page is opened
    AND sign in email field is populated    value=email@test.net
    AND continue button is pressed
    AND sign in to ramp button is pressed
    THEN sign in field password should be deemed invalid
    [Teardown]    end browser instance