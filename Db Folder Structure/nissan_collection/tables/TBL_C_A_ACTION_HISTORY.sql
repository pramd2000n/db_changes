CREATE TABLE TBL_C_A_ACTION_HISTORY (
    IID numeric(20, 0),
    VTYPE varchar(500),
    VACTIONTYPE varchar(1000),
    VSTAGE varchar(10),
    ILOAN_MASTER_ID numeric(20, 0),
    ICAMPAIGN_DETAIL_ID numeric(20, 0),
    IACTIONUSER_ID numeric(20, 0),
    IPRODUCT_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    IPARENTAL_STATUS_ID numeric(20, 0),
    IC121_STATUS_ID numeric(20, 0),
    DDATETIME datetime2,
    TNTBS_NOTES varchar(4000),
    VNTBS_TITLE varchar(4000),
    ICONTACT_TYPE_ID numeric(20, 0),
    ICYCLE_COMPLETED numeric(20, 0),
    ICYCLE_NUMBER numeric(1, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    IDPD numeric(20, 0),
    IARREARSAMOUNT numeric(20, 2),
    ICAMPACCOUNTID numeric(20, 0),

);






