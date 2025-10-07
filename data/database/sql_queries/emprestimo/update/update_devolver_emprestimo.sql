/* Devolver livros emprestados */
UPDATE EMPRESTIMOS
SET
	DATA_ENTREGUE = @DATA_ENTREGUE,
	ID_STATUS = (SELECT ID_STATUS FROM STATUS_EMPRESTIMO
    /* Em STATUS substitua o -- Status: Devolvido -- pela constante de estado correspondente */
				 WHERE STATUS = '-- Status: Devolvido --')
WHERE COD_EMPRESTIMO = @COD_EMPRESTIMO