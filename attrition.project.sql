CREATE DATABASE employeea;
USE employeea;

## DATA CLEANING
# Checking for duplicates
WITH t1 AS (SELECT *, ROW_NUMBER() OVER ( PARTITION BY EmployeeNumber) row_num
FROM employee)
SELECT COUNT(*)
FROM t1
WHERE t1.row_num = 1;

# Checking for null values
SELECT  COUNT(*) AS Total_Rows,
    SUM(EmployeeNumber IS NULL) AS EmployeeNumber_NULLs,
    SUM(Age IS NULL) AS Age_NULLs,
    SUM(Attrition IS NULL) AS Attrition_NULLs,
    SUM(BusinessTravel IS NULL) AS BusinessTravel_NULLs,
    SUM(DailyRate IS NULL) AS DailyRate_NULLs,
    SUM(Department IS NULL) AS Department_NULLs,
    SUM(DistanceFromHome IS NULL) AS DistanceFromHome_NULLs,
    SUM(Education IS NULL) AS Education_NULLs,
    SUM(EducationField IS NULL) AS EducationField_NULLs,
    SUM(EmployeeCount IS NULL) AS EmployeeCount_NULLs,
    SUM(EnvironmentSatisfaction IS NULL) AS EnvironmentSatisfaction_NULLs,
    SUM(Gender IS NULL) AS Gender_NULLs,
    SUM(HourlyRate IS NULL) AS HourlyRate_NULLs,
    SUM(JobInvolvement IS NULL) AS JobInvolvement_NULLs,
    SUM(JobLevel IS NULL) AS JobLevel_NULLs,
    SUM(JobRole IS NULL) AS JobRole_NULLs,
    SUM(JobSatisfaction IS NULL) AS JobSatisfaction_NULLs,
    SUM(MaritalStatus IS NULL) AS MaritalStatus_NULLs,
    SUM(MonthlyIncome IS NULL) AS MonthlyIncome_NULLs,
    SUM(MonthlyRate IS NULL) AS MonthlyRate_NULLs,
    SUM(NumCompaniesWorked IS NULL) AS NumCompaniesWorked_NULLs,
    SUM(Over18 IS NULL) AS Over18_NULLs,
    SUM(OverTime IS NULL) AS OverTime_NULLs,
    SUM(PercentSalaryHike IS NULL) AS PercentSalaryHike_NULLs,
    SUM(PerformanceRating IS NULL) AS PerformanceRating_NULLs,
    SUM(RelationshipSatisfaction IS NULL) AS RelationshipSatisfaction_NULLs,
    SUM(StandardHours IS NULL) AS StandardHours_NULLs,
    SUM(StockOptionLevel IS NULL) AS StockOptionLevel_NULLs,
    SUM(TotalWorkingYears IS NULL) AS TotalWorkingYears_NULLs,
    SUM(TrainingTimesLastYear IS NULL) AS TrainingTimesLastYear_NULLs,
    SUM(WorkLifeBalance IS NULL) AS WorkLifeBalance_NULLs,
    SUM(YearsAtCompany IS NULL) AS YearsAtCompany_NULLs,
    SUM(YearsInCurrentRole IS NULL) AS YearsInCurrentRole_NULLs,
    SUM(YearsSinceLastPromotion IS NULL) AS YearsSinceLastPromotion_NULLs,
    SUM(YearsWithCurrManager IS NULL) AS YearsWithCurrManager_NULLs
FROM employee;


## HR ATTRITION-OVERVIEW
# Total employess
SELECT COUNT(*) Total_employees from employee;
 
 # Overall Attrition
SELECT COUNT(*)/1470 attrition FROM employee
WHERE Attrition = "Yes";

# Average Age of the workforce
SELECT AVG(Age) Average_Age 
FROM employee;

# employess by age group
    SELECT 
     SUM(CASE WHEN Age < 25 THEN 1 ELSE 0 END) AS "Under 25",
     SUM(CASE WHEN Age >= 25 AND Age < 35 THEN 1 ELSE 0 END) AS "Between 25 and 35",
     SUM(CASE WHEN Age >= 35 AND Age < 45 THEN 1 ELSE 0 END) AS "Between 35 and 45",
     SUM(CASE WHEN Age >= 45 AND Age < 55 THEN 1 ELSE 0 END) AS "Between 45 and 55",
     SUM(CASE WHEN Age >= 55 AND Age < 65 THEN 1 ELSE 0 END) AS "Between 55 and 65",
     SUM(CASE WHEN Age >= 65 THEN 1 ELSE 0 END) AS "Over 65"
 FROM employee;

 # Employees by Education Field
SELECT EducationField,COUNT(*) 
FROM employee
GROUP BY EducationField;

#Employees by Department
SELECT Department,COUNT(*) 
FROM employee
GROUP BY 1;

# Employees by Job Role
 SELECT JobRole, COUNT(*)
 FROM employee
 GROUP BY 1;
 
# Employees by Gender
 SELECT Gender,COUNT(*)
 FROM employee
 GROUP BY 1;
 
 #Employees By Marital Status
 SELECT MaritalStatus,COUNT(*)
 FROM employee 
 GROUP BY 1;


#HR ATTRITION- DEMOGRAPHIC ANALYSIS

#attrition by Age Category
 
WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT 
     SUM(CASE WHEN Age < 25 THEN 1 ELSE 0 END) AS "Under 25",
     SUM(CASE WHEN Age >= 25 AND Age < 35 THEN 1 ELSE 0 END) AS "Between 25 and 35",
     SUM(CASE WHEN Age >= 35 AND Age < 45 THEN 1 ELSE 0 END) AS "Between 35 and 45",
     SUM(CASE WHEN Age >= 45 AND Age < 55 THEN 1 ELSE 0 END) AS "Between 45 and 55",
     SUM(CASE WHEN Age >= 55 AND Age < 65 THEN 1 ELSE 0 END) AS "Between 55 and 65",
     SUM(CASE WHEN Age >= 65 THEN 1 ELSE 0 END) AS "Over 65"
 FROM t1;


 #Attrition by Gender
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.Gender, COUNT(*)
 FROM t1
 GROUP BY 1;
 
 #Attrition by marital status
 
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.MaritalStatus, COUNT(*)
 FROM t1
 GROUP BY 1;
 
 
 # Attrition by distance from work
 
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.DistanceFromHome, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 
 
#HR ATTRITION-JOB AND EXPERIENCE ANALYSIS
 
 #Attrition by job role
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.JobRole, COUNT(*)
 FROM t1
 GROUP BY 1;
 
 ## Attrition bY Years At Company
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.YearsAtCompany, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 
 #attrition by job satisfaction
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.JobSatisfaction, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 
 #Attrition by work life balance
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.WorkLifeBalance, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 
  #Attrition by department
 
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.Department, COUNT(*)
 FROM t1
 GROUP BY 1;
 
 
 ## HR ATTRITION-SALARY AND PERFORMANCE ANALYSIS
 
 # Attrition by salary band
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT SUM(CASE WHEN t1.MonthlyIncome < 1000 THEN 1 else 0 END) AS "Below 2000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 2000 AND 4000 then 1 ELSE 0 END) AS "2000-4000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 4001 AND 6000 then 1 ELSE 0 END) AS "4001-6000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 6001 AND 8000 then 1 ELSE 0 END) AS "6001-8000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 8001 AND 10000 then 1 ELSE 0 END) AS "8001-10 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 10001 AND 12000 then 1 ELSE 0 END) AS "10 001-12 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 12001 AND 14000 then 1 ELSE 0 END) AS "12 001-14 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 14001 AND 16000 then 1 ELSE 0 END) AS "14 001-16 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 16001 AND 18000 then 1 ELSE 0 END) AS "16 001-18 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 18001 AND 20000 then 1 ELSE 0 END) AS "18 001-20 000",
 SUM(CASE WHEN t1.MonthlyIncome BETWEEN 20001 AND 22000 THEN 1 ELSE 0 END ) AS "20 001-22 000"
 FROM t1;
 
 #Attrition by Job level
  WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.JobLevel, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 

 #attrition By Percent Salary Hike
 WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.PercentSalaryHike, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1;
 
 #attrition by years since last promotion
  WITH t1 AS (SELECT * 
 FROM employee
 WHERE attrition = "Yes")
 
 SELECT t1.YearsSinceLastPromotion, COUNT(*)
 FROM t1
 GROUP BY 1
 ORDER BY 1
 
 
 
 

 
 


 
 
 
 
 
 
 
 
 