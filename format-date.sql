SELECT employees.EmployeeId, employees.LastName, employees.FirstName, strftime('%d/%m/%Y', employees.HireDate) HireFrenchDate
FROM employees
ORDER BY datetime(HireDate, '') ASC;