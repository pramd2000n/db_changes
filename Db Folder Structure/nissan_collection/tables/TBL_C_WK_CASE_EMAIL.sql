CREATE TABLE TBL_C_WK_CASE_EMAIL (
    IID numeric(20, 0),
    ICASEDTLID numeric(20, 0),
    ITEMPLATEID numeric(20, 0),
    VTYPE varchar(1000),
    ILOAN_MASTER_ID numeric(20, 0),
    VCONTRACTNO varchar(1000),
    IASSIGNGROUPID numeric(20, 0),
    IASSIGNUSERID numeric(20, 0),
    VSUBJECT text,
    VMSGBODY text,
    VSENTEMAILADDRS varchar(4000),
    VSTATUS numeric(20, 0),
    VRESPONSE text,
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






