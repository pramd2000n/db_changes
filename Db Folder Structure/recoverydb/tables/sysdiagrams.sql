CREATE TABLE sysdiagrams (
    name nvarchar NOT NULL(128),
    principal_id int NOT NULL,
    diagram_id int NOT NULL,
    version int,
    definition varbinary,

);
