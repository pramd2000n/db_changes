CREATE TABLE TBL_C_EX_SET_COMMISSION_STRUCTURE_OD (
    IID numeric NOT NULL(20, 0),
    IAGENCYID numeric(20, 0),
    ICOMMISSIONRATE numeric(20, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
