CREATE TABLE TBL_C_SET_MASTER_PRODUCT (
    IID numeric NOT NULL(20, 0),
    VMASTERPRODUCTCODE varchar(200),
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
