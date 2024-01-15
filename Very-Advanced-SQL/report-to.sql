SELECT e1.EmployeeId AS EmployeeId, e1.FirstName || ' ' || e1.LastName AS EmployeeName,
       CASE
            WHEN e1.ReportsTo IS NULL THEN NULL
            ELSE e2.FirstName || ' ' || e2.LastName
        END AS ReportsTo
FROM employees e1, employees e2
WHERE e1.ReportsTo = e2.EmployeeId OR e1.ReportsTo IS NULL
GROUP BY e1.EmployeeId