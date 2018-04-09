*** Settings ***
Library   RequestsLibrary
Library   Collections
Library   OperatingSystem
Library   json
Library   ../MyLib/Auth/
Library   ../MyLib/Config/



*** Keywords ***
Json Load
    [Arguments]  ${path}
    ${f}     Get File     ${path}
    ${api}   Evaluate      json.loads('''${f}''')     json
    [Return]  ${api}

Config Load
    [Arguments]   ${env}   ${section}
    ${config}  Config_Section  ${CURDIR}/../Conf/Env_${env}.conf    ${section}
    [Return]  ${config}


Post Json
    [Arguments]    ${env}   ${path}    &{data}
    ${module}   Evaluate    '${path}'.split("/")[-2]
    Log    ${CURDIR}
    ${api}    Json Load   ${CURDIR}/../${path}.json
    Set To Dictionary     ${api['data']}   &{data}
    ${config}  Config Load   ${env}   ${module}
    ${signed_data}     Sign   ${config['accessid']}   ${config['accesskey']}  ${api['data']}
    Create Session    url    ${config['base_url']}
    ${resp}       Post Request     url    ${api['url']}     data=${signed_data}     headers=${api['headers']}
    Should Be Equal As Strings     ${resp.status_code}    200
    ${resp_data}     To Json       ${resp.content}
    [Return]    ${resp_data}