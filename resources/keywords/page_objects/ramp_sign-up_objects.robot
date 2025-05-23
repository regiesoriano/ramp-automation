*** Variables ***
${sign_up_ramp_logo}    //div[@class='KenRampLogoRoot-sc-6081f148-0 ioCbcl']
${sign_up_background}    //div[@class='RyuAppRoot']
${sign_up_apply_heading}    //h2[contains(text(),"Apply for Ramp")]
${sign_up_email}    //input[@name='email']
${sign_up_first_name}    //input[@name='first_name']
${sign_up_last_name}    //input[@name='last_name']
${sign_up_password}    //input[@name='password']
${sign_up_email_tooltip_button}    (//div[contains(@class, 'RyuInputBaseIcon')])[1]
${sign_up_first_name_tooltip_button}    (//div[contains(@class, 'RyuInputBaseIcon')])[2]
${sign_up_last_name_tooltip_button}    (//div[contains(@class, 'RyuInputBaseIcon')])[3]
${sign_up_password_tooltip_button}    //button[@class='RyuButtonRoot-GOpuD jrcYzl RyuButtonRoot--primaryColor RyuButtonRoot--lean RyuButtonRoot--iconOnly RyuButtonRoot--iconOnlyRounded']
${sign_up_email_tooltip_text}    //div[contains(text(),"This is the email you are using to apply to Ramp")]
${sign_up_first_name_tooltip_text}    //div[contains(text(),"Your legal first name as listed on a driver’s license, passport, etc")]
${sign_up_last_name_tooltip_text}    //div[contains(text(),"Your legal last name as listed on a driver’s license, passport, etc")]
${sign_up_password_tooltip_text}    //div[contains(text(),"Show password")]
${sign_up_start_application}    //button[@type='submit']
${sign_up_password_complexity_indicator}    //span[@class='@class='RyuTextAsRoot-gEkmgS jxtUTP RyuInputCaptionRoot-fbRGeJ eiPHPO RyuTextAsRoot RyuTextAsRoot--hushedColor']
${sign_up_email_invalid_indicator}    //input[@name='email']/ancestor::*[4][contains(@class, '--hasError')]
${sign_up_first_name_invalid_indicator}    //input[@name='first_name']/ancestor::*[4][contains(@class, '--hasError')]
${sign_up_last_name_invalid_indicator}    //input[@name='last_name']/ancestor::*[4][contains(@class, '--hasError')]
${sign_up_password_invalid_indicator}    //input[@name='password']/ancestor::*[4][contains(@class, '--hasError')]
