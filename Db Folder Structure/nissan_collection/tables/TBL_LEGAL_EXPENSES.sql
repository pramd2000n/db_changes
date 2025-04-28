CREATE TABLE TBL_LEGAL_EXPENSES (
    IID numeric(20, 0),
    ILOANMASTERID numeric(20, 0),
    ILEGAL_CASE_ID numeric(20, 0),
    ILEGAL_STEP_ID numeric(20, 0),
    VREMARK varchar(1000),
    IAPPROVE numeric(20, 0),
    IAPPROVEBY numeric(20, 0),
    DAPPROVEDATE datetime2,
    IDELIND numeric(1, 0),
    DELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






