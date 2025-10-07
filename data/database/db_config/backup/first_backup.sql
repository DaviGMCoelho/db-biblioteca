USE db_biblioteca;
BACKUP DATABASE db_biblioteca
	TO DISK = 'C:\SQLServerBackups\db_biblioteca.bak'
	WITH FORMAT,
		MEDIANAME = 'SQLServerBackups',
		NAME = 'Backup total da biblioteca';