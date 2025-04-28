CREATE TABLE TBL_C_EX_AGENCY_ALLOCATION (
    IID numeric(20, 0),
    IAGENCYID numeric(10, 0),
    IPRODUCTID numeric(10, 0),
    VBATCHTYPE varchar(100),
    VBATCHNO varchar(100),
    VALLOCATIONTYPE varchar(100),
    IACCOUNTCOUNT numeric(10, 0),
    IMINAMOUNT numeric(20, 2),
    IARREASAMOUNT numeric(20, 2),
    IINTERESTAMOUNT numeric(20, 2),
    IOUTSTANDAMOUNT numeric(20, 2),
    ITOCOLLECTAMOUNT numeric(20, 2),
    DBATCHSTARTDATE datetime2,
    DBATCHENDDATE datetime2,
    ICOLLECTEDAMOUNT numeric(20, 2),
    IVERIFIED numeric(1, 0),
    IVERIFIEDBY numeric(20, 0),
    DVERIFIEDDATE datetime2,
    IAPPROVED numeric(1, 0),
    IAPPROVEDBY numeric(20, 0),
    DAPPROVEDDATE datetime2,
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






