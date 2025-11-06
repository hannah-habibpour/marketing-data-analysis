SELECT
    g.Country,
    CAST(ROUND(COUNT(cj.Action) * 1.0 / COUNT(DISTINCT c.CustomerID), 2) AS DECIMAL(10,2)) AS PurchaseFrequency
FROM dbo.geography AS g
LEFT JOIN dbo.customers AS c
    ON g.GeographyID = c.GeographyID
LEFT JOIN dbo.customer_journey AS cj
    ON c.CustomerID = cj.CustomerID
WHERE cj.Action = 'Purchase'
GROUP BY g.Country
ORDER BY PurchaseFrequency DESC;