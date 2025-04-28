CREATE TABLE TBL_C_A_LOAN_TASKS (
    IID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ITASKCATEGORY_ID numeric(20, 0),
    IASSIGN_USER numeric(20, 0),
    IASSIGN_GROUP numeric(20, 0),
    VTITLE varchar(500),
    VDESCRIPTION varchar(1000),
    VTASKATTACHMENT varchar(500),
    VREPLYTITLE varchar(500),
    VREPLYDESCRIPTION varchar(1000),
    VREPLYATTACHMENT varchar(500),
    IADDED_BY numeric(20, 0),
    DADDED_DATE datetime2,
    IREAD numeric(20, 0),
    DREAD_DATE datetime2,
    IREPLY numeric(20, 0),
    IREPLY_BY numeric(20, 0),
    DREPLY_DATE datetime2,
    DUPDATEDATE datetime2,
    DDELETEDDATE datetime2,
    VURL varchar(1000),

);






