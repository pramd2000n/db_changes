CREATE TABLE users (
    id bigint NOT NULL,
    name nvarchar NOT NULL(255),
    email nvarchar NOT NULL(255),
    email_verified_at datetime,
    password nvarchar NOT NULL(255),
    remember_token nvarchar(100),
    created_at datetime,
    updated_at datetime,
    LOGIN_TYPE int NOT NULL,

);
