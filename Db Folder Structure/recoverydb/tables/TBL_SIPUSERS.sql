CREATE TABLE TBL_SIPUSERS (
    IID numeric NOT NULL(20, 0),
    USERNAME varchar(250),
    SIPUSERNAME varchar(250),
    SIPUSERPASSWORD varchar(250),
    SIPUSERFULLNAME varchar(250),
    SIPUSEREMAIL varchar(250),
    SIPUSERID numeric(20, 0),
    IUSERID numeric(20, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    SIPUSERTYPE numeric(20, 0),

);
