SELECT employees.FirstName, employees.LastName, CAST(strftime('%Y', employees.HireDate) - strftime('%Y', employees.BirthDate ) AS INT)ApproximateAge
FROM employees
ORDER BY ApproximateAge ASC