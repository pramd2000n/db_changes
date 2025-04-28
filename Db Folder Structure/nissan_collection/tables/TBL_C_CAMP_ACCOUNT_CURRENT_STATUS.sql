CREATE TABLE TBL_C_CAMP_ACCOUNT_CURRENT_STATUS (
    IID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    IUSE_FOR_CAMPAIGN varchar(100),
    DDATE_UPDATE datetime2,
    DDAYS_TO_ELIMINATE int,
    ITOTAL_BALANCE decimal(20, 2),
    IARR_TOT_AMT decimal(20, 2),
    IARR_MIN_AMT decimal(20, 2),
    IARR_DAYS numeric(20, 0),
    IARR_CAP_AMT decimal(20, 2),
    IARR_INT_AMT decimal(20, 2),
    IARR_OTH_AMT varchar(50),
    IPENALTY_AMT decimal(20, 2),
    DACC_CHG_OFF_BAL decimal(20, 2),
    DACC_CHG_OFF_DATE datetime2,
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    IPRODUCT_ID numeric(20, 0),
    iCampaign_Section_ID numeric(20, 0),
    iDays_Last_RPC numeric(5, 0),
    iDays_In_Collection numeric(5, 0),
    vCampaign_Note varchar(1000),
    DDELETEDDATE2 datetime2,

);






