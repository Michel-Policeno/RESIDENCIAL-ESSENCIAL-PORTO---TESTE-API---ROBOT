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

   *** Variables ***
   ${CLIENT_ID}        COLE_AQUI_SEU_CLIENT_ID
   ${CLIENT_SECRET}    COLE_AQUI_SEU_CLIENT_SECRET

Renomeia o arquivo de variables.EXEMPLO.resource -> variables.resource 
(ou seja, remova o 'EXEMPLO' do nome do arquivo)


## ▶️ Executar os Testes
Para rodar todos os testes e gerar os relatórios de execução, utilize o comando:
robot --outputdir output tests/


## 📊 Ver Resultados
Após a execução, arquivos HTML serão gerados automaticamente na raiz do projeto:
|__output/
|_____log.html
|_____output.xml
|_____report.html


🧪 Autor
Desenvolvido por Michel Policeno
Meu linkedin: https://www.linkedin.com/in/michel-policeno-85a866212/


