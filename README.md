# 🏠 Residencial Essencial Porto - Testes Automatizados de API com ROBOT

Este projeto implementa uma suíte de testes automatizados, utilizando **Robot Framework**, para a API **Residencial Essencial** da **Porto Seguro**.


## 📦 Objetivo

Automatizar os testes funcionais e de precificação da API, cobrindo:

- Geração de token.
- Validação da precificação em todas regiões.
- Transmissão de proposta.


## 📁 Estrutura do Projeto

RESIDENCIAL-ESSENCIAL-PORTO---TESTE-API---ROBOT/

|__resources/                                   # Keywords reutilizáveis

|_____________autenticacao.keywords.resource

|_____________calculo.keywords.resource

|_____________proposta.keywords.resource

|_____________validar.precificacao.keywords.resource

|

|__tests/                                       # Casos de teste organizados por assunto

|_____________01-autenticacao.robot

|_____________02-precificacao.robot

|_____________03-proposta.robot

|

|__variables/                                   # Arquivo com variáveis reutilizáveis

|_____________tabela_precos_base.csv

|_____________variables.resource

|

|__.gitignore

|__README.md 


## 🧰 Instalação e Configuração
Necessário Python instalado em sua máquina (Python 3.9 ou superior)

### 1) 📦 Clonar o Repositório
git clone https://github.com/Michel-Policeno/RESIDENCIAL-ESSENCIAL-PORTO---TESTE-API---ROBOT.git

### 2) 📚 Instalar as Dependências
pip install robotframework
pip install robotframework-requests

### 3) ⚙️ Configurar as Variáveis
Abra o arquivo variables.EXEMPLO.resource na pasta variables e preencha as credenciais da API:

```robot
*** Variables ***  
${CLIENT_ID}        COLE_AQUI_SEU_CLIENT_ID
${CLIENT_SECRET}    COLE_AQUI_SEU_CLIENT_SECRET

```
Renomeia o arquivo de variables.EXEMPLO.resource -> variables.resource 
(ou seja, remova o 'EXEMPLO' do nome do arquivo)


## ▶️ Executar os Testes
Para rodar todos os testes e gerar os relatórios de execução, utilize o comando:
robot --outputdir output tests/


## 📊 Ver Resultados
Após a execução da suíte de testes, o Robot Framework gera automaticamente **arquivos de resultado** na raiz do projeto, dentro da pasta output:

Estrutura:

|__output/

|_____log.html   # Log detalhado de cada passo executado

|_____output.xml  # Arquivo técnico de resultados (usado por ferramentas externas)

|_____report.html  # Resumo geral da execução

### 🔍 Onde ver os **detalhes do response da API**

Todos os testes registram o conteúdo completo do response das requisições feitas à API, através da keyword: Adicionar response ao arquivo log.

Com isso, podemos consultar o conteúdo completo do response diretamente no log.html.

### 1) Abra o arquivo log.html no seu navegador:
Vá até a pasta output

Dê duplo clique em log.html

### 2) Escolha o teste:
Na barra lateral esquerda, clique sobre o nome do teste desejado para expandi-lo e visualizar as keywords executadas.

### 3) Veja o Response Completo
Procure a Keyword - Adicionar response ao arquivo log, clique para expandi.

Procure a Keyword - Response Completo: json, clique para expandi.

### Alternativa 
Use a busca do navegador (Ctrl+F) para encontrar rapidamente chaves específicas, como:

"access_token", "numeroOrcamentoExterno", "numeroProposta"


🧪 Autor

Desenvolvido por Michel Policeno

Meu linkedin: https://www.linkedin.com/in/michel-policeno-85a866212/


