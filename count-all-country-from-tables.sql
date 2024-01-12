SELECT
    Country,
    SUM(EmployeesCount + CustomersCount + InvoicesCount) AS Total,
    SUM(EmployeesCount) AS Employees,
    SUM(CustomersCount) AS Customers,
    SUM(InvoicesCount) AS Invoices
FROM (
    SELECT
        Country,
        COUNT(*) AS EmployeesCount,
        0 AS CustomersCount,
        0 AS InvoicesCount
    FROM Employees
    GROUP BY Country

    UNION ALL

    SELECT
        Country,
        0 AS EmployeesCount,
        COUNT(*) AS CustomersCount,
        0 AS InvoicesCount
    FROM Customers
    GROUP BY Country

    UNION ALL

    SELECT
        BillingCountry AS Country,
        0 AS EmployeesCount,
        0 AS CustomersCount,
        COUNT(*) AS InvoicesCount
    FROM Invoices
    GROUP BY BillingCountry
)
GROUP BY Country;
