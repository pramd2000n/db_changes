CREATE TABLE TBL_C_A_AGENT_ACTION (
    IID numeric(20, 0),
    IUSER_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ISECTION_MAIN_ID numeric(20, 0),
    ICAMPAIGN_DETAIL_ID numeric(20, 0),
    ICAMPAIGN_ACCOUNT_ID numeric(20, 0),
    IDELIQUENT_ID numeric(20, 0),
    IACCESS_TIME datetime2,
    IACTION_TIME datetime2,
    IHIST_ID numeric(20, 0),
    VREMARKS varchar(100),
    ICALL_COUNT numeric(20, 0),
    IALL_ACTION numeric(20, 0),
    RPC numeric(20, 0),
    NRPC numeric(20, 0),
    RPC_TYPE varchar(200),
    EXP_TYPE varchar(200),
    VEXTRA varchar(200),
    IDPD numeric(20, 0),
    IARREARSAMOUNT numeric(20, 2),
    IREQCOUNT numeric(20, 0),
    IPTPARRVALUE numeric(20, 2),
    VCONTACT_NO varchar(400),
    IRPC_NO varchar(200),
    IPTPID numeric(20, 0),
    OTHER_ACTION varchar(1000),

);






