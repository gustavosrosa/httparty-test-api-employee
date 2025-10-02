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
    
    Cenario: Alterar um novo produto
        Dado que o usuario deseja alterar um produto
        Quando ele realizar a requisicao de alteracao de produto
        Entao deve alterar um novo produto com sucesso
    
    Cenario: Alterar um produto inexistente 
        Dado que o usuario deseja alterar um produto inexistente
        Quando ele realizar a requisicao de alteracao de produto inexistente
        Entao deve mostrar um erro de produto nao existe
    
    Cenario: Excluir um produto
        Dado que o usuario deseja excluir um produto
        Quando ele realizar a requisicao de exclusao de produto
        Entao deve excluir um produto com sucesso