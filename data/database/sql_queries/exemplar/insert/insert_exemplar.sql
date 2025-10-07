/* Adiciona exemplares */
INSERT INTO EXEMPLARES (COD_LIVRO, COD_EXEMPLAR, ID_ESTADO)
VALUES (
	@COD_LIVRO, 
	@COD_EXEMPLAR,
	'-- Status: Ativo --') /* Em ID_ESTADO e substitua o -- Status: Ativo -- pela constante de estado correspondente */