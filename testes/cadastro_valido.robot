*** Settings ***
Documentation     Cadastro de colaboradores com dados válidos.
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Organo
Test Teardown     Fechar o navegador

*** Test Cases ***
Criar um card com os campos preenchidos
    [Tags]    smoke
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então devo ver 1 card(s) criado(s)

Criar vários cards seguidos
    Quando eu criar 3 cards
    Então devo ver 3 card(s) criado(s)

Criar um card para cada time
    Quando eu criar um card para cada time
    Então devo ver 7 card(s) criado(s)
