CREATE TABLE TBL_MS_PROVINCE (
    IID numeric NOT NULL(20, 0),
    ICOUNTRYID numeric(20, 0),
    VPROVINCECODE varchar(200),
    VNAME varchar(200),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
