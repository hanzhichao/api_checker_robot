*** Settings ***
Resource    ../../Public/http.robot


*** Test Case ***
测试获取站点可售商品
    [Template]   获取站点可售商品
    test  116.523829   39.929469    57    1       # 匹配青年路站点



*** Keywords ***
获取站点可售商品
    [Arguments]   ${env}    ${lng}    ${lat}    ${station}   ${status}
    ${resp}     Post Json   ${env}   Api/Shop/Istation_getGoodsCode_POST   lng=${lng}    lat=${lat}
    Should Be Equal As Strings   ${resp['code']}     100000
    Should Be Equal AS Strings   ${resp['data']['station_id']}    ${station}
    Should Be Equal AS Strings   ${resp['data']['status']}     ${status}