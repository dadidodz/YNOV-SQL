SELECT employees.FirstName, employees.LastName, CAST(strftime('%Y', employees.HireDate) - strftime('%Y',employees.BirthDate ) AS FLOAT)ApproximateAge
FROM employees
ORDER BY ApproximateAge