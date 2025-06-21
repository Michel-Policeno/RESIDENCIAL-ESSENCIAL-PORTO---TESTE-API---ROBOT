*** Settings ***
Library        RequestsLibrary

*** Keywords ***
Adicionar response ao arquivo log
    [Documentation]    Armazena o json do response nos arquivos de saida do Robot  
    [Arguments]    ${response}
    ${json}=    Call Method    ${response}    json
    Log     Response Completo: ${json}

Imprimir response ao console
    [Documentation]    Imprimi no console uma parte do response  
    [Arguments]    ${response}    ${palavra_chave_json}
    ${json}=    Call Method    ${response}    json
    ${resultado}=    Get From Dictionary  ${json}    ${palavra_chave_json}          
    Log To Console     ${palavra_chave_json}: ${resultado} 

