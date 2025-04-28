CREATE TABLE TBL_C_MD_NOTIFICATION (
    IID numeric(20, 0),
    ITYPEID varchar(1000),
    IUSERID numeric(20, 0),
    IGROUPID numeric(20, 0),
    VDISPLAYTYPE varchar(100),
    VTITLE varchar(1000),
    VBODY varchar(1000),
    IREADRECEIPT numeric(1, 0),
    IACKNOLEDGEREQUEST numeric(1, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    ICASEDTLID numeric(20, 0),
    VREDIRECTURL varchar(2000),
    ILoanMasterID numeric(20, 0),
    DSCHEDULE_DATETIME datetime2,

);






