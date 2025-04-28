CREATE TABLE TBL_USERS_ARCHIVE (
    ARCHIVE_ID numeric(20, 0),
    IID numeric(20, 0),
    IGROUPID numeric(20, 0),
    VUSERNAME varchar(250),
    password varchar(1000),
    VPASSWORDSALT varchar(1000),
    VSCOPE varchar(100),
    DLASTLOGIN datetime2,
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    ARCHIVE_DATE date,

);






