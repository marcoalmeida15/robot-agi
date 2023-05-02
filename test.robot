*** Settings ***
Documentation    Essa suíte testa o menu de pesquisa do blog da agi
Resource         resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário: Pesquisar artigo existente
    Dado que estou na página inicial do blog
    Quando clico na lupa para pesquisar
    E digito o título de um artigo existente
    E clico no botão de pesquisa
    Então devo ver o resultado da busca com o artigo correspondente

Cenário: Pesquisar artigo inexistente
    Dado que estou na página inicial do blog
    Quando clico na lupa para pesquisar
    E digito um título inexistente
    E clico no botão de pesquisa
    Então devo ver uma mensagem informando que nenhum resultado foi encontrado
    E deve ser possível pesquisar novamente direto da página

Cenário: Pesquisar artigo com termos múltiplos
    Dado que estou na página inicial do blog
    Quando clico na lupa para pesquisar
    E digito dois ou mais termos relacionados a um artigo existente
    E clico no botão de pesquisa
    Então devo ver o resultado da busca com o artigo correspondente aos termos pesquisados

Cenário: Pesquisar com entrada vazia
    Dado que estou na página inicial do blog
    Quando clico na lupa para pesquisar
    E deixo o campo de pesquisa em branco
    E clico no botão de pesquisa
    Então devo ver todos os resultados existentes