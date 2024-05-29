import sqlite3

# Conectar ao banco de dados (ou criar se não existir)
conn = sqlite3.connect('livraria.db')
cursor = conn.cursor()

# Criar tabelas
cursor.execute('''
CREATE TABLE IF NOT EXISTS Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS Livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    autor_id INTEGER,
    preco REAL NOT NULL,
    estoque INTEGER NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS Vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    data_venda DATE NOT NULL,
    quantidade INTEGER NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
)
''')

# Criar trigger
cursor.execute('''
CREATE TRIGGER IF NOT EXISTS AtualizarEstoque
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.livro_id;
END;
''')

# Commitar as alterações e fechar a conexão
conn.commit()
conn.close()
