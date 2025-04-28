CREATE TABLE TBL_C_A_RECOVERY_CASE (
    IID numeric(20, 0),
    VPTYPE_CODE varchar(500),
    IFILEID numeric(18, 0),
    ICUSTOMERID numeric(20, 0),
    IALLOCATIONOFFICER_ID numeric(18, 0),
    ICASETYPEID numeric(20, 0),
    VCASE_TYPE varchar(1000),
    VCASE_NO varchar(100),
    ICASE_ARREARS numeric(20, 2),
    ICASE_VALUE numeric(20, 2),
    DFILE_RECEIVED_DATE datetime2,
    DCASE_FILED_DATE datetime2,
    DASSET_ACQ_ACTION_DATE datetime2,
    IPUBLISH numeric(1, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IADDEDBY numeric(20, 0),
    IUPDATEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    DUPDATEDDATE datetime2,
    IPROPOSED_AUCTIONEER_ID int,

);






