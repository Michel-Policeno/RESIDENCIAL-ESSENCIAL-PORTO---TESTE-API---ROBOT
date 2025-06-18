*** Settings ***
Library     Collections
Library     BuiltIn
Library     OperatingSystem

*** Variables ***
${CSV_PATH}    ${EXECDIR}/variables/tabela_precos_base.csv

*** Keywords ***
Validar Precificacao Com CSV
    [Documentation]    Compara os premios informados no response da cotação com os valores fixados no arquivo CSV     
    [Arguments]    ${regiao}    ${tipo_residencia}    ${response}
   
    ${json}=    Call Method    ${response}    json
    ${retorno}=    Get From Dictionary    ${json}    retornoCalculo

    Ler CSV Filtrado Por Regiao E Tipo    ${regiao}    ${tipo_residencia}
    ${esperados}=    Set Variable    ${FILTRADOS_CSV}


    FOR    ${plano}    IN    @{retorno}
        ${codigo}=       Get From Dictionary    ${plano}    codigoPlanoCobertura
        ${parcelamento}=    Get From Dictionary    ${plano}    parcelamento
        ${parcela}=      Get From Dictionary    ${parcelamento}    valorParcela
        ${turbinado}=    Get From Dictionary    ${parcelamento}    valorParcelaTurbinado

        ${esperado}=    Buscar plano da Lista    ${esperados}    ${codigo}
        
        Should Be Equal As Numbers    ${parcela}       ${esperado['valorParcela']}          
        Should Be Equal As Numbers    ${turbinado}     ${esperado['valorParcelaTurbinado']}    
    END


Ler CSV Filtrado Por Regiao E Tipo
    [Documentation]    Lê o arquivo CSV e retorna apenas as linhas correspondentes à região e ao tipo de imóvel informados 
    [Arguments]    ${regiao}    ${tipo}
    ${caminho}=    Set Variable    ${CSV_PATH}
    ${dados}=    Evaluate    list(__import__('csv').DictReader(open(r"""${caminho}""", encoding='utf-8', newline=''), delimiter=';'))    modules=csv
    ${filtrados}=    Create List

    FOR    ${row}    IN    @{dados}
        ${match_regiao}=    Get From Dictionary    ${row}    Regiao
        ${match_tipo}=      Get From Dictionary    ${row}    TipoResidencia
        ${regiao_strip}=    Evaluate    '${match_regiao}'.strip()
        ${tipo_strip}=      Evaluate    '${match_tipo}'.strip()
        Run Keyword If    '${regiao_strip}' == '${regiao}' and '${tipo_strip}' == '${tipo}'    Append To List    ${filtrados}    ${row}
    END

    Set Test Variable    ${FILTRADOS_CSV}    ${filtrados}


Buscar plano da Lista
    [Documentation]    Localiza no CSV a linha correspondente ao código do plano que está sendo validado.
    [Arguments]    ${lista}    ${codigo}
    FOR    ${row}    IN    @{lista}
        ${cod_csv}=    Convert To Integer    ${row["codigoPlanoCobertura"]}
        Run Keyword If    ${cod_csv} == ${codigo}    Return From Keyword    ${row}
    END
    Fail    Plano ${codigo} não encontrado na base de precificação