MySQL Examples in Module 5

Lesson 1

1.
 SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents 
  FROM Enrollment, Offering  
  WHERE Offering.OfferNo = Enrollment.OfferNo 
    AND OffYear = 2013
  GROUP BY Offering.OfferNo;

-- Equivalent version using the join operator style
 SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents 
  FROM Enrollment INNER JOIN Offering ON Offering.OfferNo = Enrollment.OfferNo
  WHERE OffYear = 2013
  GROUP BY Offering.OfferNo;


2.
SELECT Enrollment.OfferNo, CourseNo, 
       AVG(StdGPA) AS AvgGPA
 FROM Offering, Enrollment, Student
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo
   AND OffYear = 2012 AND OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, CourseNo
 HAVING AVG(StdGPA) > 3.0; 

-- Equivalent version using the join operator style
SELECT Enrollment.OfferNo, CourseNo, 
       AVG(StdGPA) AS AvgGPA
 FROM Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo 
   INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
 WHERE OffYear = 2012 AND OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, CourseNo
 HAVING AVG(StdGPA) > 3.0;

3. 
SELECT Enrollment.OfferNo, Offering.CourseNo, 
       AVG(StdGPA) AS AvgGPA
 FROM Offering, Enrollment, Student, Course
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo
   AND Course.CourseNo = Offering.CourseNo
   AND OffYear = 2012 AND OffTerm = 'FALL'
 GROUP BY Enrollment.OfferNo, Offering.CourseNo
 HAVING AVG(StdGPA) > 3.0;

-- Equivalent version using the join operator style
SELECT Enrollment.OfferNo, Offering.CourseNo, 
       AVG(StdGPA) AS AvgGPA
 FROM Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo 
   INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
   INNER JOIN Course ON Course.CourseNo = Offering.CourseNo
 WHERE OffYear = 2012 AND OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, Offering.CourseNo
 HAVING AVG(StdGPA) > 3.0; 


Lesson 2
1.
SELECT OfferNo, Offering.CourseNo, CrsUnits, OffDays,
       OffLocation, OffTime
 FROM Faculty, Course, Offering 
 WHERE Faculty.FacNo = Offering.FacNo
   AND Offering.CourseNo = Course.CourseNo 
   AND OffYear = 2012 AND OffTerm = 'FALL'  
   AND FacFirstName = 'LEONARD' 
   AND FacLastName = 'VINCE';

-- Equivalent version using the join operator style
SELECT OfferNo, Offering.CourseNo, CrsUnits, OffDays,
       OffLocation, OffTime
 FROM Faculty INNER JOIN Offering
    ON Offering.FacNo = Faculty.FacNo 
   INNER JOIN Course ON Course.CourseNo = Offering.CourseNo
 WHERE OffYear = 2012 AND OffTerm = 'FALL'  
   AND FacFirstName = 'LEONARD' 
   AND FacLastName = 'VINCE';
 
2.
SELECT Offering.OfferNo, Offering.CourseNo, OffDays,
       OffLocation, OffTime, FacFirstName, 
       FacLastName
 FROM Faculty, Offering, Enrollment, Student 
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo 
   AND Faculty.FacNo = Offering.FacNo 
   AND OffYear = 2013 AND OffTerm = 'SPRING' 
   AND StdFirstName = 'BOB' 
   AND StdLastName = 'NORBERT';

-- Equivalent version using the join operator style
SELECT Offering.OfferNo, Offering.CourseNo, OffDays,
       OffLocation, OffTime, FacFirstName, 
       FacLastName
 FROM Faculty INNER JOIN Offering ON Faculty.FacNo = Offering.FacNo
      INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
      INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
 WHERE OffYear = 2013 AND OffTerm = 'SPRING' 
   AND StdFirstName = 'BOB' 
   AND StdLastName = 'NORBERT';


3.
SELECT Offering.OfferNo, Offering.CourseNo, OffDays,
       OffLocation, OffTime, CrsUnits, FacFirstName,
       FacLastName
 FROM Faculty, Offering, Enrollment, Student, Course
 WHERE Faculty.FacNo = Offering.FacNo 
   AND Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo
   AND Offering.CourseNo = Course.CourseNo
   AND OffYear = 2013 AND OffTerm = 'SPRING' 
   AND StdFirstName = 'BOB'
   AND StdLastName = 'NORBERT';

-- Equivalent version using the join operator style
SELECT Offering.OfferNo, Offering.CourseNo, OffDays,
       OffLocation, OffTime, CrsUnits, FacFirstName,
       FacLastName
 FROM Faculty INNER JOIN Offering ON Faculty.FacNo = Offering.FacNo
      INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
      INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
      INNER JOIN Course ON Offering.CourseNo = Course.CourseNo
 WHERE OffYear = 2013 AND OffTerm = 'SPRING' 
   AND StdFirstName = 'BOB' 
   AND StdLastName = 'NORBERT';


Lesson 3
1.
SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents,
        AVG(StdGPA) AS AvgGPA
  FROM Enrollment, Offering, Student  
  WHERE Offering.OfferNo = Enrollment.OfferNo
    AND Student.StdNo = Enrollment.StdNo
    AND OffYear = 2013
  GROUP BY Offering.OfferNo
  HAVING AVG(StdGPA) > 3.3;

-- Equivalent version using the join operator style
SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents,
        AVG(StdGPA) AS AvgGPA
  FROM Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
       INNER JOIN Student ON Student.StdNo = Enrollment.StdNo  
  WHERE OffYear = 2013
  GROUP BY Offering.OfferNo
  HAVING AVG(StdGPA) > 3.3;


2.
SELECT CourseNo, Enrollment.OfferNo, 
       Count(*) AS NumStudents
 FROM Offering, Enrollment
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND OffYear = 2013 AND OffTerm = 'SPRING' 
 GROUP BY Enrollment.OfferNo, CourseNo;

-- Equivalent version using the join operator style
SELECT CourseNo, Enrollment.OfferNo, 
       Count(*) AS NumStudents
 FROM Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
 WHERE OffYear = 2013 AND OffTerm = 'SPRING' 
 GROUP BY Enrollment.OfferNo, CourseNo;


3.
SELECT Enrollment.OfferNo, CourseNo, FacFirstName, 
       FacLastName, AVG(StdGPA) AS AvgGPA
 FROM Offering, Enrollment, Student, Faculty
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo
   AND Faculty.FacNo = Offering.FacNo    
   AND OffYear = 2012 AND OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, CourseNo, 
       FacFirstName, FacLastName
 HAVING AVG(StdGPA) > 3.0;

-- Equivalent version using the join operator style
SELECT Enrollment.OfferNo, CourseNo, FacFirstName, 
       FacLastName, AVG(StdGPA) AS AvgGPA
 FROM Offering INNER JOIN Enrollment ON Offering.OfferNo = Enrollment.OfferNo
      INNER JOIN Student ON Student.StdNo = Enrollment.StdNo
      INNER JOIN Faculty ON Faculty.FacNo = Offering.FacNo
 WHERE OffYear = 2012 AND	 OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, CourseNo, 
       FacFirstName, FacLastName
 HAVING AVG(StdGPA) > 3.0;

Lesson 4
1.
SELECT FacNo AS PerNo, FacFirstName AS FirstName,
       FacLastName AS LastName, FacCity AS City, 
       FacState AS State 
 FROM Faculty
	UNION
SELECT StdNo AS PerNo, StdFirstName AS FirstName,
       StdLastName AS LastName, StdCity AS City, 
       StdState AS State 
 FROM Student;


2.
SELECT FacNo AS PerNo, FacFirstName AS 
       FirstName, FacLastName AS LastName, 
       FacCity AS City, FacState AS State
 FROM Faculty
   UNION ALL
SELECT StdNo AS PerNo, StdFirstName AS
       FirstName, StdLastName AS LastName, 
       StdCity AS City, StdState AS State
 FROM Student;

3.
SELECT FacNo AS PerNo, FacFirstName AS 
       FirstName, FacLastName AS LastName, 
       FacCity AS City, FacState AS State
 FROM Faculty
   WHERE (FacNO, FacFirstName, FacLastName,
	FacCity, FacState) NOT IN
(
SELECT StdNo AS PerNo, StdFirstName AS
       FirstName, StdLastName AS LastName, 
       StdCity AS City, StdState AS State
 FROM Student);

Lesson 5
1.
INSERT INTO Student 
 (StdNo, StdFirstName, StdLastName, 
  StdCity, StdState, StdZip, StdClass, 
  StdMajor, StdGPA) 
 VALUES ('999999999','JOE','STUDENT','SEATAC',
   'WA','98042-1121','FR','IS', 0.0);

2.
UPDATE Student 
 SET StdMajor = 'ACCT', 
     StdClass = 'SO' 
 WHERE StdFirstName = 'HOMER' 
   AND StdLastName = 'WELLS';

3.
DELETE FROM Student 
 WHERE StdMajor = 'IS' 
   AND StdClass = 'SR';
