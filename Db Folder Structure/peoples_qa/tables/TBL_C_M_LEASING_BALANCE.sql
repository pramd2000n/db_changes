CREATE TABLE TBL_C_M_LEASING_BALANCE (
    IID numeric NOT NULL(18, 0),
    ILOAN_MASTER_ID int,
    VCONTRACT_NO varchar(50),
    VCIF varchar(20),
    VDESCR varchar(100),
    IPERIOD numeric(18, 0),
    VPERSTS varchar(25),
    ITOT_DUE_RENTALS numeric(20, 2),
    ITOT_PAID_RENTALS numeric(20, 2),
    IOD_TOTDUE numeric(20, 2),
    IOD_TOTPAID numeric(20, 2),
    DRENEWALDATE date,
    DSUMMARY_DATE date,
    IGROSS_RENTAL numeric(20, 2),
    INO_OF_RENTAL_SETTLED numeric(20, 2),
    IGURID_1 numeric(18, 0),
    IGURID_2 numeric(18, 0),
    IFEEAMT numeric(20, 2),
    INO_OF_ARREARS numeric(18, 0),
    IJOBCOUNT numeric(18, 0),
    DFIRST_JB_DATE date,
    DLAST_JB_DATE date,
    VLAST_JB_SEIZING_NAME varchar(500),
    VGUR_NAME varchar(150),

);
