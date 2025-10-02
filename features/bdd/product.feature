# language: pt

Funcionalidade: Manipular Produtos
    Para averiguar informacoes
    O usuario do sistema
    Deseja poder manipular informacoes dos Produtos

    Cenario: Buscar informacoes do produto
        Dado que o usuario consulte informacoes de produto
        Quando ele realizar a pesquisa
        Entao uma lista de produtos deve retornar
    
    Cenario: Buscar informacoes de um produto inexistente
        Dado que o usuario consulte informacoes de produto que nao existe
        Quando ele realizar a pesquisa de um produto inexistente
        Entao deve mostrar um erro de produto nao encontrado
    
    Cenario: Cadastrar um novo produto
        Dado que o usuario deseja incluir um produto
        Quando ele realizar a requisicao
        Entao deve cadastrar um novo produto