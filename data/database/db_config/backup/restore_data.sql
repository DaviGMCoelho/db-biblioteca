RESIORE DATABASE db_biblioteca
	FROM DISK = 'C:\SQLServerBackups\db_biblioteca.bak'
	WITH FILE = @file_index,
	RECOVERY;