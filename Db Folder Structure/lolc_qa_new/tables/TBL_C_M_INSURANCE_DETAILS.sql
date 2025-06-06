CREATE TABLE TBL_C_M_INSURANCE_DETAILS (
    IID numeric NOT NULL(20, 0),
    CONTRACT_NO varchar(45),
    POLICY_NO varchar(45),
    VALUE numeric(25, 5),
    OPEN_DATE date,
    EXPIRE_DATE date,
    ACTIVE int,
    CURRENCY int,
    COLLATERAL_TYPE numeric(20, 0),
    COLLATERAL_DESCRIPTION varchar(4000),
    INSURANCE_COMPANY varchar(4000),
    COLLATERAL_VALUE numeric(20, 2),
    COLLATERAL_ITEM varchar(100),

);
