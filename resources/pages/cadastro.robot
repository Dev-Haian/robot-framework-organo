*** Settings ***
Documentation    Page Object do formulário de cadastro de colaboradores do Organo.
...              Seletores ficam em variáveis; os testes só usam as keywords em BDD.
Resource         ../main.robot

*** Variables ***
${CAMPO_NOME}       id:form-nome
${CAMPO_CARGO}      id:form-cargo
${CAMPO_IMAGEM}     id:form-imagem
${CAMPO_TIME}       class:lista-suspensa
${BOTAO_CARD}       id:form-botao
${CARD}             class:colaborador
@{TIMES}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
Dado que eu preencha os campos do formulário
    [Arguments]    ${time}=${TIMES}[0]
    ${nome}=      FakerLibrary.First Name
    ${cargo}=     FakerLibrary.Job
    ${imagem}=    FakerLibrary.Image Url    width=100    height=100
    Input Text       ${CAMPO_NOME}      ${nome}
    Input Text       ${CAMPO_CARGO}     ${cargo}
    Input Text       ${CAMPO_IMAGEM}    ${imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${time}

E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Dado que eu clique no botão criar card sem preencher nada
    Click Element    ${BOTAO_CARD}

Então devo ver ${quantidade} card(s) criado(s)
    Wait Until Element Is Visible    ${CARD}
    Page Should Contain Element      ${CARD}    limit=${quantidade}

Quando eu criar ${quantidade} cards
    FOR    ${i}    IN RANGE    ${quantidade}
        Dado que eu preencha os campos do formulário
        E clique no botão criar card
    END

Quando eu criar um card para cada time
    FOR    ${time}    IN    @{TIMES}
        Dado que eu preencha os campos do formulário    ${time}
        E clique no botão criar card
    END

Então devo ver as mensagens de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
