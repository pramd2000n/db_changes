CREATE TABLE failed_jobs (
    id bigint NOT NULL,
    uuid nvarchar NOT NULL(255),
    connection nvarchar NOT NULL(-1),
    queue nvarchar NOT NULL(-1),
    payload nvarchar NOT NULL(-1),
    exception nvarchar NOT NULL(-1),
    failed_at datetime NOT NULL,

);
