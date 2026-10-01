# 🤖 Robot Framework – Organo

[![Validação Robot Framework](https://github.com/Dev-Haian/robot-framework-organo/actions/workflows/robot.yml/badge.svg)](https://github.com/Dev-Haian/robot-framework-organo/actions/workflows/robot.yml)
![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?logo=robotframework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)

Testes de interface com **Robot Framework + SeleniumLibrary**, escritos em português e no estilo BDD (Dado / Quando / Então).

A aplicação testada é o **Organo**, um app React de estudo que cadastra colaboradores em cards separados por time.

Começou como projeto de curso. Depois eu reorganizei: Page Object, keywords com parâmetros, validação pela quantidade de cards na tela (em vez de `Sleep`) e URL e navegador configuráveis.

---

## Como um teste fica escrito

```robot
Criar um card para cada time
    Quando eu criar um card para cada time
    Então devo ver 7 card(s) criado(s)
```

Qualquer pessoa do time, inclusive quem não programa, consegue ler e revisar o cenário.

## O que é testado

| Suíte | Cenários |
| --- | --- |
| `cadastro_valido.robot` | criar 1 card · criar vários cards seguidos · criar um card para cada um dos 7 times |
| `cadastro_invalido.robot` | enviar o formulário vazio mostra os erros de campo obrigatório |

## Estrutura

```
resources/
├── main.robot                  # importa bibliotecas e recursos em um lugar só
├── pages/cadastro.robot        # Page Object: seletores + keywords do formulário
└── shared/setup_teardown.robot # abrir e fechar o navegador
testes/
├── cadastro_valido.robot
└── cadastro_invalido.robot
```

## Como rodar

Pré-requisitos: Python 3.10+, Google Chrome e o Organo rodando em `http://localhost:3000`.

```bash
pip install -r requirements.txt

robot testes                                   # roda tudo
robot --include smoke testes                   # só os testes marcados como smoke
robot -v BROWSER:headlesschrome testes         # sem abrir janela
robot -v URL:http://localhost:5173 testes      # outra URL
```

O resultado sai em `report.html` e `log.html`.

> **Sobre o CI:** os testes dependem do Organo rodando localmente. No GitHub Actions, o pipeline roda `robot --dryrun`, que valida a sintaxe e as keywords de todas as suítes a cada push.

---

Feito por **Haian Vilas Boas**, QA. [LinkedIn](https://www.linkedin.com/in/haian-vilas-boas-806647221/) · [Portfólio](https://haianportifolio.framer.website/)
