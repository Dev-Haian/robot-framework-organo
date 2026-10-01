*** Settings ***
Documentation    Abrir e fechar o navegador. URL e navegador podem ser trocados na linha de comando:
...              robot -v URL:http://localhost:3000 -v BROWSER:headlesschrome testes
Resource         ../main.robot

*** Variables ***
${URL}        http://localhost:3000/
${BROWSER}    chrome

*** Keywords ***
Dado que eu acesse o Organo
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser
