*** Settings ***
Documentation     Validação dos campos obrigatórios do formulário.
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Organo
Test Teardown     Fechar o navegador

*** Test Cases ***
Enviar o formulário vazio mostra os erros de campo obrigatório
    [Tags]    smoke
    Dado que eu clique no botão criar card sem preencher nada
    Então devo ver as mensagens de campo obrigatório
