*** Settings ***
Library     Collections
Resource    ../resources/calculo.keywords.resource
Resource    ../variables/variables.resource
Resource    ../resources/validar.precificacao.keywords.resource

*** Test Cases ***
CT003 - Validar precificação CENTRO OESTE - CASA
    Criar Orcamento Valido    995550    1    '74355519'
    Validar Precificacao Com CSV    Centro Oeste    Casa    ${response}


CT004 - Validar precificação CENTRO OESTE - APARTAMENTO
    Criar Orcamento Valido    995551    2    '74355519'
    Validar Precificacao Com CSV    Centro Oeste    Apartamento    ${response}


CT005 - Validar precificação Nordeste - CASA
    Criar Orcamento Valido    995552    1    '41307400'
    Validar Precificacao Com CSV    Nordeste    Casa    ${response}


CT006 - Validar precificação Nordeste - APARTAMENTO
    Criar Orcamento Valido    995553    2    '41307400'
    Validar Precificacao Com CSV    Nordeste    Apartamento    ${response}


CT007 - Validar precificação Norte - CASA
    Criar Orcamento Valido    995554    1    '76801000'
    Validar Precificacao Com CSV    Norte    Casa    ${response}


CT008 - Validar precificação Norte - APARTAMENTO
    Criar Orcamento Valido    995555    2    '76801000'
    Validar Precificacao Com CSV    Norte    Apartamento    ${response}


CT009 - Validar precificação Sudeste - CASA
    Criar Orcamento Valido    995556    1    '01513000'
    Validar Precificacao Com CSV    Sudeste    Casa    ${response}


CT010 - Validar precificação Sudeste - APARTAMENTO
    Criar Orcamento Valido    995557    2    '01513000'
    Validar Precificacao Com CSV    Sudeste    Apartamento    ${response}


CT011 - Validar precificação Sul (regioes metropolitanas) - CASA
    Criar Orcamento Valido    995558    1    '90220011'
    Validar Precificacao Com CSV    Sul (regioes metropolitanas)    Casa    ${response}


CT012 - Validar precificação Sul (regioes metropolitanas) - APARTAMENTO
    Criar Orcamento Valido    995559    2    '90220011'
    Validar Precificacao Com CSV    Sul (regioes metropolitanas)    Apartamento    ${response}


CT013 - Validar precificação Sul (demais regioes) - CASA
    Criar Orcamento Valido    995560    1    '96085250'
    Validar Precificacao Com CSV    Sul (demais regioes)    Casa    ${response}


CT014 - Validar precificação Sul (demais regioes) - APARTAMENTO
    Criar Orcamento Valido    995561    2    '96085250'
    Validar Precificacao Com CSV    Sul (demais regioes)    Apartamento    ${response}


