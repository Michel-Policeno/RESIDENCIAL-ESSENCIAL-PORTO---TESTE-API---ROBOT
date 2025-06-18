*** Settings ***
Library        RequestsLibrary
Resource      ../variables/variables.resource
Resource    ./autenticacao.keywords.resource
Resource    ./calculo.keywords.resource


*** Keywords ***
transmitir proposta válida 
    [Documentation]    Envia uma requisição de proposta com dados válidos e retorna o response
    [Arguments]    ${numero_orcamento}    ${tipo_residencia}     
    
    Obter Token de acesso
    ${access_token}=  Get From Dictionary    ${response.json()}    access_token
    ${token}=    Set Variable    Bearer ${access_token}

    ${headers}=    Create Dictionary
    ...    Authorization=${token}
    ...    Content-Type=${JSON_HEADER}

    ${orcamento}=    Create Dictionary
    ...    susep=COL10J
    ...    dataInicioVigencia=10/07/2025
    ...    dataFimVigencia=10/07/2026
    ...    codigoTipoResidencia=${tipo_residencia}
    ...    codigoPlanoPacote=6
    ...    codigoPlanoServico=1359

    ${proposta}=    Create Dictionary
    ...    idExterno=${numero_orcamento}

    ${contato}=    Create Dictionary
    ...    numeroDddTelefoneCelular=21
    ...    numeroTelefoneCelular=991514451
    ...    email=vanessamagalhaes.souza@portoseguro.com.br

    ${documento}=    Create Dictionary
    ...    tipo=2
    ...    numero=3332266000000
    ...    orgaoExpedidor=SSP
    ...    dataExpedicao=03-02-2022
    ...    dataValidade=02-01-2026

    ${segurado}=    Create Dictionary
    ...    nomeProponente=Lider do Brasil Assistencia Residencial e Pessoal LTDA
    ...    tipoPessoa=J
    ...    cpfCnpjProponente=13945339000102
    ...    dataNascimento=14-06-2011
    ...    codigoAtividadeProfissional=160
    ...    flagResidenteNacional=S
    ...    tipoSexo=M
    ...    contato=${contato}
    ...    documentoIdentificacao=${documento}

    ${objeto}=    Create Dictionary
    ...    logradouro=SAO PAULO
    ...    numero=242
    ...    bairro=LIBERDADE
    ...    cidade=SAO PAULO
    ...    complemento=A205
    ...    uf=SP
    ...    cep=01513000
    ...    tipoLogradouro=R

    ${dataVencimento}=    Create Dictionary
    ...    mes=10
    ...    ano=2026

    ${cartao}=    Create Dictionary
    ...    numeroCartao=5162920328223344
    ...    cartaoPorto=false
    ...    codigoVerificacao=756
    ...    bandeiraCartao=2
    ...    dataVencimento=${dataVencimento}

    ${pagamento}=    Create Dictionary
    ...    codigoFormaPagamento=97
    ...    quantidadeParcelas=12
    ...    cartaoCredito=${cartao}

    ${corretor}=    Create Dictionary
    ...    flagCopiaCorretor=S
    ...    emailDestinoNotificacao=vanessamagalhaes.souza@portoseguro.com.br

    ${body}=    Create Dictionary
    ...    codigoCanal=45
    ...    orcamento=${orcamento}
    ...    proposta=${proposta}
    ...    segurado=${segurado}
    ...    objetoSeguro=${objeto}
    ...    pagamento=${pagamento}
    ...    corretor=${corretor}
  
   
    ${retorno}=    POST    url=${PROPOSTA_ENDPOINT}    json=${body}    headers=${headers}    expected_status=any  
    Set Suite Variable    ${retorno}