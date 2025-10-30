select
    CustomerID,
    GeographyID,
    UPPER(Gender) as Gender,
    CASE
        when Age < 25 then 'Young Adult'
        when Age between 25 and 44 then 'Adult'
        when Age between 45 and 64 then 'Middle-Aged'
        when Age >= 65 then 'Senior'
        else 'Unknown'
    END as AgeGroup
from dbo.customers
