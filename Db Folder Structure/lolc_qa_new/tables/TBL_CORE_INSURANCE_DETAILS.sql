CREATE TABLE TBL_CORE_INSURANCE_DETAILS (
    CONTRACT_NO varchar(45),
    POLICY_NO varchar(45),
    VALUE numeric(25, 5),
    CURRENCY int,
    OPEN_DATE date,
    EXPIRE_DATE date,
    ACTIVE int,
    ACTIVE_DATE date,
    COLLATERAL_TYPE numeric(20, 0),
    COLLATERAL_DESCRIPTION varchar(4000),
    INSURANCE_COMPANY varchar(4000),
    COLLATERAL_VALUE numeric(20, 2),
    INNACTIVE_DATE date,
    COLLATERAL_ITEM varchar(100),

);
