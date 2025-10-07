USE db_biblioteca
GO

CREATE USER usuario_select FOR LOGIN usuario_select;
CREATE USER usuario_insert FOR LOGIN usuario_insert;
CREATE USER usuario_update FOR LOGIN usuario_update;
CREATE USER usuario_delete FOR LOGIN usuario_delete;
CREATE USER usuario_backup FOR LOGIN usuario_select;
CREATE USER usuario_restore FOR LOGIN usuario_restore;