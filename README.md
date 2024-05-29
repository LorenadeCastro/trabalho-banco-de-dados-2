# trabalho-banco-de-dados-2
Trabalho desenvolvido para o curso de Introdução a Programação da Proz - cursos técnicos.

Tabela Livros

    id (INTEGER, PRIMARY KEY, AUTOINCREMENT)
    titulo (TEXT, NOT NULL)
    autor_id (INTEGER, FOREIGN KEY)
    preco (REAL, NOT NULL)
    estoque (INTEGER, NOT NULL)

Tabela Autores

    id (INTEGER, PRIMARY KEY, AUTOINCREMENT)
    nome (TEXT, NOT NULL)
    pais (TEXT, NOT NULL)

Tabela Vendas

    id (INTEGER, PRIMARY KEY, AUTOINCREMENT)
    livro_id (INTEGER, FOREIGN KEY)
    data_venda (DATE, NOT NULL)
    quantidade (INTEGER, NOT NULL)
