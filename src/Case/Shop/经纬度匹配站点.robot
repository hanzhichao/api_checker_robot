*** Settings ***
Resource    ../../Public/http.robot


*** Test Case ***
测试经纬度匹配站点
    [Template]   经纬度匹配站点
    test   116.523829   39.929469    57    1       # 匹配青年路站点



*** Keywords ***
经纬度匹配站点
    [Arguments]   ${env}   ${lng}    ${lat}    ${station}   ${status}
    ${resp}     Post Json   ${env}   Api/Shop/Istation_matchStation_POST   lng=${lng}    lat=${lat}
    Should Be Equal As Strings   ${resp['code']}     100000
    Should Be Equal AS Strings   ${resp['data']['station']}    ${station}
    Should Be Equal AS Strings   ${resp['data']['status']}     ${status}