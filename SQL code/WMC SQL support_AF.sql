/*

Tutorial for WMC peer support
Windows functions in SQL
Author: Aura Frizzati
Date: 10/10/2022

*/

/*******************************************************************************************/
/* Step [1]: Creation of a fictitious inventory dataset */



WITH mock_hospital_data(calendar_month, hospital_dept, n_patients) AS(

	SELECT calendar_month, hospital_dept, n_patients

	FROM(
		VALUES 
			 (1,'Cardiology', 400) --
			,(2,'Dental', 500)
			,(1,'Orthopaedics', 700)
			,(1,'Dental', 300)
			,(2,'Cardiology', 400) --
			,(3,'Cardiology', 600) --
			,(4,'Cardiology', 300) --
			,(4,'Dental', 200)
			,(5,'Dental', 300)
			,(2,'Orthopaedics', 800)
			,(5,'Cardiology', 400) --
			,(5,'Orthopaedics', 800)
			,(6,'Orthopaedics', 700)
			,(6,'Cardiology', 500) --
			
			) 

	AS mock_hospital_data(calendar_month, hospital_dept, n_patients) 

	)

--SELECT * FROM mock_hospital_data ORDER BY hospital_dept, calendar_month


SELECT 
	hospital_dept
	,calendar_month
	,n_patients
	, AVG(n_patients) OVER(
					PARTITION BY hospital_dept
					) AS avg_month_patients
FROM mock_hospital_data


/*
SELECT 
	hospital_dept
	,AVG(n_patients) AS avg_month_patients
FROM mock_hospital_data
GROUP BY hospital_dept
*/

