SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN ChurnFlag = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        SUM(CASE WHEN ChurnFlag = 1 THEN 1 ELSE 0 END) * 100.0 /
        NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS ChurnRatePercent
FROM dbo.TelcoCustomerChurn_Clean
GROUP BY Contract
ORDER BY ChurnRatePercent DESC;