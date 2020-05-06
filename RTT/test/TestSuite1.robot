*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Log    Suite4 setup    
Suite Teardown    Log    Suite teardown    
Test Setup    Log    test case setup    
Test Teardown    Log    test tesrdown 

Default Tags    Sanity   

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log  Hello World
    
FIRSTSELENIUMTEST
    [Tags]     search
    Open Browser      https://google.com     chrome
    Set Browser Implicit Wait    5
    Input Text        name =q                Automation Step by Step
    Press Keys    name =q    ENTER
    # Click Button      name=btnK    

    Sleep    2
    Close Browser
    Log    Test Completed 
    
SampleLoginTest
    [Tags]    reglogin
    [Documentation]    This is a simple login test
    
    Open Browser          ${URL}    chrome
    Set Browser Implicit Wait    5 
    LoginKw
    Click Element         link=Welcome Admin       
    Click Element        link=Logout    
    Close Browser
    Log                   Test completed 
    Log    This test was executed by %{username} on %{os}        
                
*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/
@{Credentials}    Admin    admin123
&{LoginData}     username=Admin    password=admin123


*** Keywords ***
LoginKw
    Input Text            id=txtUsername        @{Credentials}[0]
    Input Password        id=txtPassword        &{LoginData}[password]
    Click Button          id=btnLogin    
    