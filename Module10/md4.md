**Student** (<u>StdNo</u>, StdName, StdAddress, StdCity, StdState, StdZip, StdEmail)

**Institution** (<u>InstID</u>, InstName, InstMascot)

**Loan** (<u>LoanNo</u>, ProcDate, DisbMethod, DisbBank, DateAuth, NoteValue, Subsidized, Rate, StdNo, InstID, LenderNo)
FOREIGN KEY(StdNo) REFERENCE Student
FOREIGN KEY(InstID) REFERENCE Institution
FOREIGN KEY(LenderNo) REFERENCE Lender
StdNo NOT NULL
InstID NOT NULL
LenderNo NOT NULL

**Lender** (<u>LenderNo</u>, LendName)

**DisburseLine** (<u>LoanNo</u>, <u>DateSent</u>, Amount, OriFee, GuarFee)
FOREIGN KEY(LoanNo) REFERENCE Loan
LoanNo NOT NULL

*The pk of DisburseLine is the combination of LoanNo and DateSent*