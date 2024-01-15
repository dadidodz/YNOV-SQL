SELECT e."LastName",
	e."FirstName",
	(
		SELECT COUNT("InvoiceId") FROM invoices
	) AS 'Total Sell',
	COUNT(i."InvoiceId") AS 'Total Sell By Employee',
	IFNULL((
		SELECT ib."BillingCountry"
		FROM employees eb
		LEFT JOIN customers cb ON eb."EmployeeId" = cb."SupportRepId"
		LEFT JOIN invoices ib ON cb."CustomerId" = ib."CustomerId"
		WHERE eb."EmployeeId" = e."EmployeeId"
		GROUP BY ib."BillingCountry"
		ORDER BY COUNT("BillingCountry") DESC
		LIMIT 1
	), '-') AS 'Country With Most Sales',
	IFNULL((
		SELECT gb."Name"
		FROM employees eb
		LEFT JOIN customers cb ON eb."EmployeeId" = cb."SupportRepId"
		LEFT JOIN invoices ib ON cb."CustomerId" = ib."CustomerId"
		LEFT JOIN invoice_items itb ON ib."InvoiceId" = itb."InvoiceId"
		LEFT JOIN tracks tb ON itb."TrackId" = tb."TrackId"
		LEFT JOIN genres gb ON tb."GenreId" = gb."GenreId"
		WHERE eb."EmployeeId" = e."EmployeeId"
		GROUP BY gb."GenreId"
		ORDER BY COUNT(gb."GenreId") DESC
		LIMIT 1
	), '-') AS 'Most Genre Selled',
	IFNULL((
		SELECT mtb."Name"
		FROM employees eb
		LEFT JOIN customers cb ON eb."EmployeeId" = cb."SupportRepId"
		LEFT JOIN invoices ib ON cb."CustomerId" = ib."CustomerId"
		LEFT JOIN invoice_items itb ON ib."InvoiceId" = itb."InvoiceId"
		LEFT JOIN tracks tb ON itb."TrackId" = tb."TrackId"
		LEFT JOIN media_types mtb ON tb."MediaTypeId" = mtb."MediaTypeId"
		WHERE eb."EmployeeId" = e."EmployeeId"
		GROUP BY mtb."MediaTypeId"
		ORDER BY COUNT(mtb."MediaTypeId") DESC
		LIMIT 1
	), '-') AS 'Most Media Type Selled',
	IFNULL(ROUND(
		(
			SELECT CASE WHEN COUNT(id."InvoiceId") = 0
				THEN NULL
				WHEN COUNT(id."InvoiceId") = (
					SELECT COUNT(ie."InvoiceId")
					FROM employees ee
					LEFT JOIN customers ce ON ee."EmployeeId" = ce."SupportRepId"
					LEFT JOIN invoices ie ON ce."CustomerId" = ie."CustomerId"
					GROUP BY ee."EmployeeId"
					ORDER BY COUNT(ie."InvoiceId") DESC
					LIMIT 1
					)
				THEN NULL
				ELSE COUNT(id."InvoiceId")
				END AS 'test'
			FROM employees ed
			LEFT JOIN customers cd ON ed."EmployeeId" = cd."SupportRepId"
			LEFT JOIN invoices id ON cd."CustomerId" = id."CustomerId"
			WHERE ed."EmployeeId" = e."EmployeeId"
			GROUP BY ed."EmployeeId"
		)*100.0
		/
	(
		SELECT COUNT(ic."InvoiceId")
		FROM employees ec
		INNER JOIN customers cc ON ec."EmployeeId" = cc."SupportRepId"
		INNER JOIN invoices ic ON cc."CustomerId" = ic."CustomerId"
		GROUP BY ec."EmployeeId"
		ORDER BY COUNT(ic."InvoiceId") DESC
		LIMIT 1
	),
		2), '-') AS 'Percentage sales compared best seller'
FROM employees e
LEFT JOIN customers c ON e."EmployeeId" = c."SupportRepId"
LEFT JOIN invoices i ON c."CustomerId" = i."CustomerId"
GROUP BY e."EmployeeId";