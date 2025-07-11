*** Settings ***
Library     Collections
Resource    ../resources/calculo.keywords.resource
Resource    ../variables/variables.resource
Resource    ../resources/validar.precificacao.keywords.resource
Resource    ../resources/log.keywords.resource


*** Test Cases ***
CT003 - ORÇAMENTO COM DADOS CORRETOS
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido     ${numero_cotacao_aleatorio}    1    '74355519'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno
 
CT004 - ORÇAMENTO SEM TOKEN  
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento com token invalido     ${numero_cotacao_aleatorio}    ''
    Should Be Equal As Strings    ${response.status_code}    401
       

CT005 - ORÇAMENTO COM TOKEN INVÁLIDO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento com token invalido     ${numero_cotacao_aleatorio}    'tokenInvalido'
    Should Be Equal As Strings    ${response.status_code}    401
    

CT006 - ORÇAMENTO COM TOKEN EXPIRADO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento com token invalido     ${numero_cotacao_aleatorio}    'MGIwNmIzNDUtMzI3OS00NTBhLWJiMDYtMmRhNGMwY2RmM2JkOmNiZmM0N2ZlLTQ5MDAtNGEwOC05Njg0LWJlMzNjNGM0MGU5OA=='
    Should Be Equal As Strings    ${response.status_code}    401
  

CT007 - ORÇAMENTO BODY FORMATO INVÁLIDO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento com body invalido     ${numero_cotacao_aleatorio}   
    Adicionar response ao arquivo log  ${response}
    

CT008 - ORÇAMENTO COM NUMEROORCAMENTOEXTERNO INVÁLIDO
    Criar Orcamento Valido     "587po5"    1    '74355519'
    Adicionar response ao arquivo log  ${response}


CT009 - ORÇAMENTO COM NUMEROORCAMENTOEXTERNO JÁ UTILIZADO
    Criar Orcamento Valido    995550    1    '74355519'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno
    

CT010 - ORÇAMENTO COM COMPLEMENTOCEP ZERADO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '50720000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno


CT011 - ORÇAMENTO COM CEP ALFANÚMERICO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '50720cep'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    422


CT012 - ORÇAMENTO COM CEP INICIADO EM ZERO
   ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '05075000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno

CT013 - ORÇAMENTO COM CEP RURAL
   ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '64780000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    codigoRecusa

CT014 - ORÇAMENTO COM CEP BLOQUEADO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido    ${numero_cotacao_aleatorio}    1    '57055286'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    codigoRecusa

CT015 - ORÇAMENTO COM CPF INVÁLIDO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido2     ${numero_cotacao_aleatorio}    1    '74355519'    '012345678900'
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    codigoRecusa
    Adicionar response ao arquivo log  ${response}

CT016 - ORÇAMENTO COM CPF INICIADO EM ZERO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido2     ${numero_cotacao_aleatorio}    1    '74355519'    '06458007086'
      Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno

CT017 - ORÇAMENTO COM CPF ALFANÚMERICO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido2     ${numero_cotacao_aleatorio}    1    '74355519'    '01234po78900'
    Should Be Equal As Strings    ${response.status_code}    422
     Adicionar response ao arquivo log  ${response}

CT018 - ORÇAMENTO COM DEZENACPF ZERADO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido2     ${numero_cotacao_aleatorio}    1    '74355519'    '06242016000'
    Adicionar response ao arquivo log  ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    numeroOrcamentoExterno


CT019 - ORÇAMENTO COM CPF SCORE BAIXO
    ${numero_cotacao_aleatorio}=    Evaluate    __import__('random').randint(1, 99999)
    Criar Orcamento Valido2     ${numero_cotacao_aleatorio}    1    '74355519'    '10386716048'
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    codigoRecusa
    Adicionar response ao arquivo log  ${response}
