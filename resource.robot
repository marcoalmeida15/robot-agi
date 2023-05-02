*** Settings ***
Library    SeleniumLibrary    run_on_failure=Capture Page Screenshot    screenshot_root_directory=EMBED 
Library    OperatingSystem

*** Variables ***
${url}                           https://blogdoagi.com.br
${lupa}                          //*[@id="search-open"]    
${search_pesquisar}              //*[@id="masthead"]/div[1]/div[2]/form/label/input
${search_pesquisar_novamente}    //*[@id="primary"]/section/div/form/label/input
${botao_pesquisa}                //*[@id="masthead"]/div[1]/div[2]/form/input 
${resultados}                    //*[@id="primary"]/header/h1
${sem_resultado}                 //*[@id="primary"]/section/header/h1
${resultado_dois_termos}         //*[@id="post-2725"]/div[2]/div[2]/header/h2
${todos_resultados}              //*[@id="primary"]/nav/div/span[2]

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Dado que estou na página inicial do blog
    Go To    url=${url}

Quando clico na lupa para pesquisar
    Wait Until Element Is Visible    xpath=${lupa}     10
    Click Element    xpath=${lupa} 

E digito o título de um artigo existente
    Input Text    xpath=${search_pesquisar}     text=cartão

E clico no botão de pesquisa
    Wait Until Element Is Visible    xpath=${botao_pesquisa}     10
    Click Element    xpath=${botao_pesquisa} 

Então devo ver o resultado da busca com o artigo correspondente
    Wait Until Element Is Visible    xpath=${resultados}   10

E digito um título inexistente
    Input Text    xpath=${search_pesquisar}     text=futebol    

Então devo ver uma mensagem informando que nenhum resultado foi encontrado
    Wait Until Element Is Visible    xpath=${sem_resultado} 

E deve ser possível pesquisar novamente direto da página
    Wait Until Element Is Visible    xpath=${search_pesquisar_novamente} 

E digito dois ou mais termos relacionados a um artigo existente
    Input Text    xpath=${search_pesquisar}     text=pagamento cartão

Então devo ver o resultado da busca com o artigo correspondente aos termos pesquisados
    Wait Until Element Is Visible    xpath=${resultado_dois_termos}    10

E deixo o campo de pesquisa em branco
    Input Text    xpath=${search_pesquisar}     text=

Então devo ver todos os resultados existentes
    Wait Until Element Is Visible    xpath=${todos_resultados}        10