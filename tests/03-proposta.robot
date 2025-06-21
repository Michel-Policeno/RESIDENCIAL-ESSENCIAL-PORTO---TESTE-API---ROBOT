*** Settings ***
Library     Collections
Resource    ../resources/calculo.keywords.resource
Resource    ../variables/variables.resource
Resource    ../resources/proposta.keywords.resource
Resource    ../resources/log.keywords.resource

*** Test Cases ***
CT015 - PROPOSTA COM DADOS CORRETOS - PESSOA FISICA
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '01513000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno

    transmitir proposta válida    ${numero_cotacao_aleatorio}    1
    Adicionar response ao arquivo log  ${retorno}
    Should Be Equal As Strings    ${retorno.status_code}    200 
    Dictionary Should Contain Key    ${retorno.json()}    numeroProposta
    Imprimir response ao console    ${retorno}    numeroProposta
    

CT016 - PROPOSTA COM DADOS CORRETOS - PESSOA JURIDICA
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido pessoa Juridica    ${numero_cotacao_aleatorio}    2    '01513000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno

    transmitir proposta válida    ${numero_cotacao_aleatorio}    2
    Adicionar response ao arquivo log  ${retorno}
    Should Be Equal As Strings    ${retorno.status_code}    200 
    Dictionary Should Contain Key    ${retorno.json()}    numeroProposta
    Imprimir response ao console    ${retorno}    numeroProposta
