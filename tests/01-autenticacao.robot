*** Settings ***
Library     Collections
Resource    ../variables/variables.resource
Resource    ../resources/autenticacao.keywords.resource
Resource    ../resources/log.keywords.resource

*** Test Cases ***
CT001 - OBTER TOKEN DE ACESSO
    Obter Token de acesso
    Adicionar response ao arquivo log  ${response}    
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    access_token


CT002 - OBTER TOKEN COM CREDENCIAIS INVÁLIDAS
    Obter Token de acesso credências inválidas
    Adicionar response ao arquivo log  ${response} 
    Should Be Equal As Strings    ${response.status_code}    400
    Dictionary Should Contain Key    ${response.json()}    errors


