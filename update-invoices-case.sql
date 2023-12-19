UPDATE invoices
SET Total = CASE WHEN invoices.BillingCountry = 'France' THEN Total = Total + 3
                WHEN invoices.BillingCountry = 'USA' THEN Total = Total + 5
                ELSE Total = Total + 1 END