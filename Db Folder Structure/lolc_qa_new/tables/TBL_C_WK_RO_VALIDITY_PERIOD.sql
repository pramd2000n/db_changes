CREATE TABLE TBL_C_WK_RO_VALIDITY_PERIOD (
    IID numeric NOT NULL(20, 0),
    VPRODUCTLIST varchar(200),
    IDURATION int,
    IPUBLISH numeric(38, 0),
    IADDEDBY numeric(38, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(38, 0),
    DUPDATEDATE datetime2,
    DDELETEDDATE datetime2,
    VURL varchar(1000),

);
