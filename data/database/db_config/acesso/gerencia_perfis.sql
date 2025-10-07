USE MASTER
GO

CREATE LOGIN usuario_select WITH PASSWORD = 'S3nh4Select123';
CREATE LOGIN usuario_insert WITH PASSWORD = 'S3nh4Insert123';
CREATE LOGIN usuario_update WITH PASSWORD = 'S3nh4Update123';
CREATE LOGIN usuario_delete WITH PASSWORD = 'S3nh4Deelte123';
CREATE LOGIN usuario_backup WITH PASSWORD = 'S3nh4backup123';
CREATE LOGIN usuario_restore WITH PASSWORD = 'S3nh4Restore123';

GRANT SELECT ON SCHEMA :: dbo TO usuario_select;
GRANT INSERT ON SCHEMA :: dbo TO usuario_insert;
GRANT UPDATE ON SCHEMA :: dbo TO usuario_update;
GRANT DELETE ON SCHEMA :: dbo TO usuario_delete;
ALTER ROLE db_backupoperator ADD MEMBER usuario_backup;
ALTER SERVER ROLE dbcreator ADD MEMBER usuario_restore;