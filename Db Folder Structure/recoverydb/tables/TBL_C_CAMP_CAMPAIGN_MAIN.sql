CREATE TABLE TBL_C_CAMP_CAMPAIGN_MAIN (
    IID numeric NOT NULL(20, 0),
    VTITLE varchar(100),
    ILOAN_PRODUCT_ID numeric(20, 0),
    DCURRENT_DATE_TIME datetime2,
    IUSER_ID numeric(20, 0),
    TDES varchar(100),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    IPRODUCT_ID numeric(20, 0),
    DCAMPAIGN_DATE datetime2,

);
