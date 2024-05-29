# Reabrir a conexão com o banco de dados
conn = sqlite3.connect('livraria.db')
cursor = conn.cursor()

# Inserir autores
cursor.execute("INSERT INTO Autores (nome, pais) VALUES ('Autor A', 'Brasil')")
cursor.execute("INSERT INTO Autores (nome, pais) VALUES ('Autor B', 'Portugal')")

# Inserir livros
cursor.execute("INSERT INTO Livros (titulo, autor_id, preco, estoque) VALUES ('Livro A', 1, 39.90, 100)")
cursor.execute("INSERT INTO Livros (titulo, autor_id, preco, estoque) VALUES ('Livro B', 2, 49.90, 50)")

# Inserir venda e verificar estoque
cursor.execute("INSERT INTO Vendas (livro_id, data_venda, quantidade) VALUES (1, '2024-05-29', 3)")

# Verificar estoque do livro 1
cursor.execute("SELECT estoque FROM Livros WHERE id = 1")
estoque_livro_1 = cursor.fetchone()[0]

print(f"Estoque atualizado do Livro A: {estoque_livro_1}")  # Deve ser 97

# Commitar as alterações e fechar a conexão
conn.commit()
conn.close()
