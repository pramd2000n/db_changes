CREATE TABLE TBL_C_WK_SET_PROCESS_SUB (
    IID numeric NOT NULL(20, 0),
    IPROCESSID numeric(20, 0),
    VSUBPROCESS varchar(2000),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
