**Owner** (<u>OwnId</u>, OwnName, OwnPhone)

**Property** (<u>PropId</u>, BldgName, UnitNo, Bdrms)

**Shares** (<u>OwnId</u>, <u>PropId</u>, StartWeek)
FOREIGN KEY(OwnID) REFERENCES Owner
FOREIGN KEY(PropID) REFERENCES Property