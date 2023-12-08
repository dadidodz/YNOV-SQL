SELECT employees.FirstName, employees.LastName,CAST((julianday(employees.HireDate) - julianday(employees.BirthDate)) / 365.25 AS INT) ApproximateAge
FROM employees
ORDER BY ApproximateAge ASC