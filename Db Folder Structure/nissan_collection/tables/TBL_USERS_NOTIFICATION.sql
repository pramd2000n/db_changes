CREATE TABLE TBL_USERS_NOTIFICATION (
    IID numeric(20, 0),
    IUSERID numeric(20, 0),
    VNOTIFICATIONCODE numeric(20, 0),
    VTITLE varchar(100),
    VBODY varchar(200),
    VDATA varchar(1000),
    VTYPE numeric(20, 0),
    IREAD numeric(20, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






