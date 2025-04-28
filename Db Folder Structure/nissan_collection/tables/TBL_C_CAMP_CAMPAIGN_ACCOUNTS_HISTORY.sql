CREATE TABLE TBL_C_CAMP_CAMPAIGN_ACCOUNTS_HISTORY (
    IID numeric(20, 0),
    ICAMAIGN_DETAIL_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    IPRODUCT_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    IPARENTAL_STATUS_ID numeric(20, 0),
    IACTION_ACCOUNT_STATUS_ID numeric(20, 0),
    IBE_ID numeric(20, 0),
    IDELIQUENT_ID numeric(20, 0),
    IC121_STATUS_ID numeric(20, 0),
    IUSERID_INUSE bigint,
    IACTION_TAKEN numeric(1, 0),
    ICAT2ID_REASON numeric(20, 0),
    IACTION_TYPE_ID numeric(20, 0),
    VSTATUS varchar(100),
    IHISTORY_DETAIL_ID numeric(20, 0),
    DREVIEW_DATE datetime2,
    IASSIGNED_TO int,
    ILAST_ACTIONED_USER_ID int,
    IDAYS_LAST_RPC int,
    IDAYS_IN_COLLECTION int,
    IARR_ADV_DAYS numeric(20, 0),
    IARR_ADV_AMT numeric(20, 0),
    ITOTAL_BALANCE numeric(20, 0),
    IFILTER_FLAG numeric(1, 0),
    DDATE_TIME datetime2,
    VURL varchar(1000),
    DDELETEDDATE datetime2,
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,

);






