CREATE TABLE TBL_C_DP_VEHICLE_CHECKLIST (
    IID numeric NOT NULL(20, 0),
    IYARDVEHICLEMAINID numeric(20, 0),
    CHECKLISTID numeric(20, 0),
    IPUBLISH numeric(18, 0),
    IADDEDBY varchar(50),
    IUPDATEDBY varchar(50),
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    DDELETEDDATE datetime2,
    VURL varchar(1000),

);
