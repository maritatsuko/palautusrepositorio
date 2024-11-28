*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page

*** Test Cases ***

Register With Valid Username And Password
# Käyttäjätunnuksen on oltava merkeistä a-z koostuva vähintään 3 merkin pituinen merkkijono, joka ei ole vielä käytössä
# Salasanan on oltava pituudeltaan vähintään 8 merkkiä ja se ei saa koostua pelkästään kirjaimista
    Set Username  mari
    Set Password  mari1234
    Set Password Confirmation  mari1234
    Submit Information
    Register Should Succeed
    
Register With Too Short Username And Valid Password
    Set Username  ma
    Set Password  mari1234
    Set Password Confirmation  mari1234
    Submit Information
    Register Should Fail With Message  Username should be 3 or more characters

Register With Valid Username And Too Short Password
    Set Username  mari
    Set Password  mari1
    Set Password Confirmation  mari1
    Submit Information
    Register Should Fail With Message  Password should be 8 or more characters

Register With Valid Username And Invalid Password
# salasana ei sisällä halutunlaisia merkkejä
    Set Username  mari
    Set Password  qqqqqqqq
    Set Password Confirmation  qqqqqqqq
    Submit Information
    Register Should Fail With Message  Password should also contain characters other than letters

Register With Nonmatching Password And Password Confirmation
    Set Username  mari
    Set Password  mari1234
    Set Password Confirmation  mari4567
    Submit Information
    Register Should Fail With Message  Password and password confirmation do not match

Register With Username That Is Already In Use
    Set username  kalle
    Set Password  123kalle
    Set Password Confirmation  123kalle
    Submit Information
    Register Should Fail With Message  Username is taken

#Login After Successful Registration
    

*** Keywords ***
Reset Application Create User And Go To Register Page
    Reset Application
    Create User  kalle  kalle123
    Go To Register Page

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password Confirmation
    [Arguments]  ${password_confirmation}
    Input Password  password_confirmation  ${password_confirmation}

Submit Information
    Click Button  Register

Register Should Succeed
    Welcome Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}
