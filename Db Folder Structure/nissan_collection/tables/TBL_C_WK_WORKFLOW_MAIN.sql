CREATE TABLE TBL_C_WK_WORKFLOW_MAIN (
    IID numeric(20, 0),
    VTYPE varchar(500),
    VWORKFLOW varchar(2000),
    VPRODUCTLST varchar(4000),
    ILOANAMTMIN bigint,
    ILOANAMTMAX bigint,
    IARRMIN bigint,
    IARRMAX bigint,
    IDPDMIN bigint,
    IDPDMAX bigint,
    VSTATUS varchar(2000),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    IENBLMULTIPLECASES numeric(1, 0),
    UUID varchar(20),

);






