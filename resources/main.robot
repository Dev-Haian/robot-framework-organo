*** Settings ***
Documentation    Ponto único de importação: bibliotecas e recursos usados por todos os testes.
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR

Resource         shared/setup_teardown.robot
Resource         pages/cadastro.robot
