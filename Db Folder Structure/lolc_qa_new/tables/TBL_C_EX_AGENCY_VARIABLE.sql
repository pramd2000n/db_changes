CREATE TABLE TBL_C_EX_AGENCY_VARIABLE (
    IID numeric NOT NULL(20, 0),
    IAGENCYID numeric NOT NULL(10, 0),
    IDPDMIN numeric NOT NULL(10, 0),
    IDPDMAX numeric NOT NULL(10, 0),
    IARRMIN numeric NOT NULL(10, 0),
    IARRMAX numeric NOT NULL(10, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
