CREATE TABLE TBL_USERS_LOGGED_IN (
    IID numeric(20, 0),
    IUSERID numeric(20, 0),
    VSESSION_ID varchar(1000),
    VTOKEN varchar(4000),
    IACTIVE numeric(20, 0),
    VSESSION_DET varchar(1000),
    DADDEDDATE datetime2,
    DUPDATEDDATE datetime2,
    DLOGINTIME datetime2,
    DLOGOUTTIME datetime2,
    VUSERLOGINIP varchar(100),

);






