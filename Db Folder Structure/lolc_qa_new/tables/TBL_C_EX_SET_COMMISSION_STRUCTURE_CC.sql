CREATE TABLE TBL_C_EX_SET_COMMISSION_STRUCTURE_CC (
    IID numeric NOT NULL(20, 0),
    IALLOCATIONTYPEID numeric(20, 0),
    IACHLEVELFROM numeric(20, 2),
    IACHLEVELTO numeric(20, 2),
    ICOMMISSIONRATE numeric(20, 2),
    ISEXCESSCOLLECT numeric(20, 0),
    ISPCOMMISSIONRATE numeric(20, 2),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
