/* Mostrar quantidade livros emprestados com status desejado.

Sem nenhum parâmetro em @STATUS retorna tanto ativos quando devolvidos */
SELECT l.NOME AS LIVRO, COUNT(*) AS EMPRESTADOS FROM EMPRESTIMOS e
INNER JOIN EXEMPLARES ex
	ON e.ID_EXEMPLAR = ex.ID_EXEMPLAR
INNER JOIN LIVROS l
	ON ex.ID_LIVRO = l.ID_LIVRO
WHERE (@STATUS IS NULL OR s.STATUS = @STATUS)
GROUP BY l.NOME