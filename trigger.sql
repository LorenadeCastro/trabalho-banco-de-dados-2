CREATE TRIGGER AtualizarEstoque
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.livro_id;
END;
