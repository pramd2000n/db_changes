CREATE TABLE TBL_C_SET_HOLIDAYS (
    IID numeric NOT NULL(10, 0),
    DHOLIDAY datetime2 NOT NULL,
    VDESCRIPTION varchar(100),
    VSTATE varchar(50),
    IPUBLISH numeric NOT NULL(1, 0),
    VURL varchar(100),
    IDEL_IND numeric NOT NULL(1, 0),

);
