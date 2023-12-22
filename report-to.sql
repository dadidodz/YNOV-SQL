SELECT e1.EmployeeId AS EmployeeId, e1.FirstName || ' ' || e1.LastName AS EmployeeName, e2.FirstName || ' ' || e2.LastName AS ReportsTo
FROM employees e1, employees e2
WHERE e1.ReportsTo = e2.EmployeeId