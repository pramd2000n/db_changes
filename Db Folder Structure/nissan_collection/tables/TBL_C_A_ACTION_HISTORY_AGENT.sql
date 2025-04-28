CREATE TABLE TBL_C_A_ACTION_HISTORY_AGENT (
    IID numeric(20, 0),
    IUSER_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ISECTION_MAIN_ID numeric(20, 0),
    ICAMPAIGN_DETAIL_ID numeric(20, 0),
    ICAMPAIGN_ACCOUNT_ID numeric(20, 0),
    IDELIQUENT_ID numeric(20, 0),
    IHISTORY_ID numeric(20, 0),
    IPROMISE_ID numeric(20, 0),
    IACCESS_TIME datetime2,
    IACTION_TIME datetime2,
    IACTION_TYPE varchar(100),
    VREMARKS varchar(100),
    ICALL_COUNT numeric(20, 0),
    IALL_ACTION numeric(20, 0),
    IRPC numeric(20, 0),
    INRPC numeric(20, 0),
    VRPC_TYPE varchar(200),
    VEXP_TYPE varchar(200),
    VEXTRA varchar(200),
    IPROMISEVALUE decimal(20, 2),
    IDPD numeric(20, 0),
    IARREARSAMOUNT decimal(20, 2),
    IREQCOUNT numeric(20, 0),
    VCONTACTED_NO varchar(400),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






