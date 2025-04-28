CREATE TABLE TBL_C_EX_COMMISSION_SUMMARY (
    IID numeric(20, 0),
    DEXECDATE datetime2,
    VBATCHNO varchar(1000),
    IAGENCYID numeric(20, 0),
    VAGENCYCODE varchar(1000),
    IPRODUCTID numeric(20, 0),
    YEAR numeric(6, 0),
    MONTH numeric(6, 0),
    ITOTAMTASSIGNED numeric(20, 2),
    ITOTAMTCOLLECTED numeric(20, 2),
    ITOTAMTCOVERED numeric(20, 2),
    INORMALCOMMISSIONAMT numeric(20, 2),
    IBONUSCOMMISSIONAMT numeric(20, 2),
    ITOTCOMMISSIONAMT numeric(20, 2),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    VCONTRACTNO varchar(1),
    ILOAN_MASTER_ID numeric(18, 0),

);






