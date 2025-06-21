*** Variables ***          
${TOKEN_ENDPOINT}            https://portoapi-hml.portoseguro.com.br/oauth/v2/access-token        
${ORCAMENTO_ENDPOINT}        https://portoapi-hml.portoseguro.com.br/re/api/residencia-essencial/v1/orcamento
${PROPOSTA_ENDPOINT}         https://portoapi-hml.portoseguro.com.br/re/api/residencia-essencial/v1/proposta

# Headers
${CONTENT_TYPE}              application/x-www-form-urlencoded
${JSON_HEADER}               application/json

# Grant type - token
${GRANT_TYPE}                client_credentials
${SCOPE}                     openid

# Credenciais
${CLIENT_ID}                 COLE_AQUI_SEU_CLIENT_ID
${CLIENT_SECRET}             COLE_AQUI_SEU_CLIENT_SECRET







