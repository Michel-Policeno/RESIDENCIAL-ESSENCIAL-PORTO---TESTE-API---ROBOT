*** Settings ***
Library        RequestsLibrary
Resource      ../variables/variables.resource

*** Keywords ***
Criar Base64 client_id:client_secret para autenticação
    [Documentation]    Cria a string Base64 com client_id e client_secret adicionado no arquivo variables
    ${auth_string}=    Catenate    SEPARATOR=:    ${CLIENT_ID}    ${CLIENT_SECRET}
    ${encoded_auth}=   Evaluate    __import__('base64').b64encode('${auth_string}'.encode()).decode().strip()
    Set Suite Variable    ${encoded_auth}

Obter Token de acesso
    [Documentation]    Envia requisição contendo a Base64 para autenticação
    Criar Base64 client_id:client_secret para autenticação
    ${headers}=    Create Dictionary
    ...    Authorization=Basic ${encoded_auth}
    ...    Content-Type=${CONTENT_TYPE}
    ${data}=    Create Dictionary
    ...    grant_type=${GRANT_TYPE}
    ...    scope=${SCOPE}
    ${response}=    POST    url=${TOKEN_ENDPOINT}    data=${data}    headers=${headers}
    Set Suite Variable    ${response}

Obter Token de acesso credências inválidas
    [Documentation]    Envia requisição com Authorization propositalmente errada  
    ${headers}=    Create Dictionary
    ...    Authorization=Basic ZmFrZS1pZDpmYWtlLXNlY3JldA==
    ...    Content-Type=${CONTENT_TYPE}
    ${data}=    Create Dictionary
    ...    grant_type=${GRANT_TYPE}
    ...    scope=${SCOPE}
    ${response}=    POST    url=${TOKEN_ENDPOINT}    data=${data}    headers=${headers}    expected_status=any
    Set Suite Variable    ${response}

   







 








