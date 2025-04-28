CREATE TABLE TBL_USERS_OTP (
    IID numeric(20, 0),
    IUSERID numeric(20, 0),
    OTP varchar(200),
    DEXPIRESIN datetime2,
    IOTPTYPEID numeric(20, 0),
    VVERIFY_STATUS numeric(1, 0),
    VOTPSENTSMS varchar(1000),
    VOTPSENTMAIL varchar(1000),
    IOTPSENTMAIL varchar(1000),
    IOTPSENTSMS varchar(1000),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






