CREATE TABLE TBL_C_SET_GROUP_PRIVILEGES (
    IID numeric NOT NULL(20, 0),
    IGROUPID numeric(20, 0),
    IPRIVILEGEID numeric(20, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    VURL varchar(1000),
    IUPDATEDBY numeric(38, 0),
    DUPDATEDATE datetime2,

);
