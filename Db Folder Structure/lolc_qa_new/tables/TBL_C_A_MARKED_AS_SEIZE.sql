CREATE TABLE TBL_C_A_MARKED_AS_SEIZE (
    IID numeric NOT NULL(20, 0),
    VRPOSCAT varchar(100),
    VRPOSID varchar(100),
    VRPOSCONTTNO varchar(100),
    VRPOSVEHNO varchar(100),
    VRPOSSEIZCODE varchar(100),
    DRPOSMARKEDSEIZDATE datetime2,
    VRPOSMUSER varchar(255),
    IPUBLISH numeric(18, 0),
    DADDEDAT datetime2,
    DUPDATEDATE datetime2,

);
