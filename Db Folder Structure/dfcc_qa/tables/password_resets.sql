CREATE TABLE password_resets (
    email nvarchar NOT NULL(255),
    token nvarchar NOT NULL(255),
    created_at datetime,

);
