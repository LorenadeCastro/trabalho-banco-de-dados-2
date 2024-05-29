CREATE TABLE Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL
);

CREATE TABLE Livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    autor_id INTEGER,
    preco REAL NOT NULL,
    estoque INTEGER NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

CREATE TABLE Vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    data_venda DATE NOT NULL,
    quantidade INTEGER NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
);
