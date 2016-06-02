CREATE TABLE ResourceTbl
(
  ResNo   CHAR(8) PRIMARY KEY NOT NULL,
  ResName VARCHAR(50)         NOT NULL,
  Rate    DECIMAL(8, 2)       NOT NULL,
  CONSTRAINT chk_Rate CHECK (Rate > 0)
);