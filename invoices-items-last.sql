SELECT Name
FROM tracks
WHERE TrackId IN (
    SELECT TrackId
    FROM invoice_items
    WHERE InvoiceID = (
        SELECT MAX(InvoiceID)
        FROM Invoices
    )
);