UPDATE invoices
SET Total = CASE WHEN invoices.BillingCountry = 'France' THEN Total + 3
                WHEN invoices.BillingCountry = 'USA' THEN Total + 5
                ELSE Total + 1 END