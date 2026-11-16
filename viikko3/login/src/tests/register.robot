*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page

*** Test Cases ***

Register With Valid Username And Password
    Set Username  joona
    Set Password  joona12345
    Set Password Confirmation  joona12345
    Click  button >> text=Register
    Register Should Succeed

Register With Too Short Username And Valid Password
    Set Username  jo
    Set Password  joona12345
    Set Password Confirmation  joona12345
    Click  button >> text=Register
    Register Page Should Be Open

Register With Valid Username And Too Short Password
    Set Username  joona
    Set Password  short
    Set Password Confirmation  short
    Click  button >> text=Register
    Register Page Should Be Open

Register With Username That Is Already In Use
    Set Username  kalle
    Set Password  kalle12345
    Set Password Confirmation  kalle12345
    Click  button >> text=Register
    Register Page Should Be Open

*** Keywords ***

Set Password Confirmation
    [Arguments]  ${password}
    Fill Secret  id=password_confirmation  $password

Register Should Succeed
    Get Title  ==  Welcome to Ohtu Application!

Reset Application Create User And Go To Register Page
    Reset Application
    Create User  kalle  kalle123
    Go To Register Page