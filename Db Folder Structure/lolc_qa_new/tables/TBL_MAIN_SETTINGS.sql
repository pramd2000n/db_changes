CREATE TABLE TBL_MAIN_SETTINGS (
    IID numeric NOT NULL(20, 0),
    VSETTINGNAME varchar(1000),
    VSETTINGDESCRIPTION varchar(1000),
    VSETTINGTYPE varchar(1000),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
