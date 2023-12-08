SELECT employees.FirstName, employees.LastName, - strftime('%Y',employees.BirthDate ) + strftime('%Y', employees.HireDate)  ApproximateAge
FROM employees
ORDER BY ApproximateAge