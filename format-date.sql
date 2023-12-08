SELECT employees.FirstName, employees.LastName, strftime('%Y', employees.HireDate) - strftime('%Y',employees.BirthDate ) ApproximateAge
FROM employees
ORDER BY ApproximateAge