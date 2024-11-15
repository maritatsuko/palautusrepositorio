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
    
#Register With Too Short Username And Valid Password
# ...

#Register With Valid Username And Too Short Password
# ...

#Register With Valid Username And Invalid Password
# salasana ei sisällä halutunlaisia merkkejä
# ...

#Register With Nonmatching Password And Password Confirmation
# ...

#Register With Username That Is Already In Use
#

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
