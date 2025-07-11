*** Settings ***
Library        RequestsLibrary
Resource      ../variables/variables.resource
Resource    ./autenticacao.keywords.resource
Resource    ./log.keywords.resource


*** Keywords ***
Criar Orcamento Valido 
    [Documentation]    Envia uma requisição de orçamento com dados válidos e retorna o response
    [Arguments]    ${numero_orcamento}    ${tipoResidencia}    ${cep}            
    Obter Token de acesso
    ${access_token}=  Get From Dictionary    ${response.json()}    access_token
    ${token}=    Set Variable    Bearer ${access_token}

    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}

    ${CEP_INICIO}=    Evaluate    str(${cep})[:5]
    ${CEP_COMPLEMENTO}=    Evaluate    str(${cep})[5:]

    ${body}=    Create Dictionary
    ...    numeroOrcamentoExterno=${numero_orcamento}
    ...    codigoTipoResidencia=${tipoResidencia}
    ...    codigoTipoSeguro=1
    ...    codigoTipoPessoa=1
    ...    codigoCanal=45
    ...    cep=${CEP_INICIO}
    ...    complementoCep=${CEP_COMPLEMENTO}
    ...    cpfCnpjProponente=390533447
    ...    dezenaCpfCnpj=00
   
    ${response}=    POST    url=${ORCAMENTO_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${response}
    Adicionar response ao arquivo log  ${response}


Criar Orcamento Valido pessoa Juridica
    [Documentation]    Envia uma requisição de orçamento com tipo de pessoa juridica e retorna o response
    [Arguments]    ${numero_orcamento}    ${tipoResidencia}    ${cep}        
    Obter Token de acesso
    ${access_token}=  Get From Dictionary    ${response.json()}    access_token
    ${token}=    Set Variable    Bearer ${access_token}

    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}

    ${CEP_INICIO}=    Evaluate    str(${cep})[:5]
    ${CEP_COMPLEMENTO}=    Evaluate    str(${cep})[5:]

    ${body}=    Create Dictionary
    ...    numeroOrcamentoExterno=${numero_orcamento}
    ...    codigoTipoResidencia=${tipoResidencia}
    ...    codigoTipoSeguro=1
    ...    codigoTipoPessoa=2
    ...    codigoCanal=45
    ...    cep=${CEP_INICIO}
    ...    complementoCep=${CEP_COMPLEMENTO}
    ...    cpfCnpjProponente=895302200001
    ...    dezenaCpfCnpj=30
   
    ${response}=    POST    url=${ORCAMENTO_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${response}
    Adicionar response ao arquivo log  ${response}


Criar Orcamento com token invalido 
    [Documentation]    Envia uma requisição de orçamento com token invalido como parâmetro
    [Arguments]    ${numero_orcamento}       ${access_token}      
  
    ${token}=    Set Variable    Bearer ${access_token}
    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}


    ${body}=    Create Dictionary
    ...    numeroOrcamentoExterno=${numero_orcamento}
    ...    codigoTipoResidencia=2
    ...    codigoTipoSeguro=1
    ...    codigoTipoPessoa=1
    ...    codigoCanal=45
    ...    cep=21040
    ...    complementoCep=241
    ...    cpfCnpjProponente=390533447
    ...    dezenaCpfCnpj=00
   
    ${response}=    POST    url=${ORCAMENTO_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${response}
    

Criar Orcamento com body invalido 
    [Documentation]    Envia uma requisição de orçamento com body faltando entidades
    [Arguments]    ${numero_orcamento}         
   Obter Token de acesso
    ${access_token}=  Get From Dictionary    ${response.json()}    access_token
    ${token}=    Set Variable    Bearer ${access_token}

    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}


    ${body}=    Create Dictionary
    ...    numeroOrcamentoExterno=${numero_orcamento}
    ...    codigoTipoResidencia=2
    ...    codigoTipoSeguro=1
    ...    codigoTipoPessoa=1
    ...    codigoCanal=45
    ...    cep=21040
    ...    complementoCep=241
   
    ${response}=    POST    url=${ORCAMENTO_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${response}


Criar Orcamento Valido2 
    [Documentation]    Envia uma requisição de orçamento com dados válidos e retorna o response
    [Arguments]    ${numero_orcamento}    ${tipoResidencia}    ${cep}    ${cpf}            
    Obter Token de acesso
    ${access_token}=  Get From Dictionary    ${response.json()}    access_token
    ${token}=    Set Variable    Bearer ${access_token}

    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}

    ${CEP_INICIO}=    Evaluate    str(${cep})[:5]
    ${CEP_COMPLEMENTO}=    Evaluate    str(${cep})[5:]

    ${CPF_INICIO}=    Evaluate    str(${cpf})[:9]
    ${CPF_COMPLEMENTO}=    Evaluate    str(${cpf})[9:]

    ${body}=    Create Dictionary
    ...    numeroOrcamentoExterno=${numero_orcamento}
    ...    codigoTipoResidencia=${tipoResidencia}
    ...    codigoTipoSeguro=1
    ...    codigoTipoPessoa=1
    ...    codigoCanal=45
    ...    cep=${CEP_INICIO}
    ...    complementoCep=${CEP_COMPLEMENTO}
    ...    cpfCnpjProponente=${CPF_INICIO}
    ...    dezenaCpfCnpj=${CPF_COMPLEMENTO}
   
    ${response}=    POST    url=${ORCAMENTO_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${response}
    
