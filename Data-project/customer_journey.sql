select
    JourneyID,
    CustomerID,
    ProductID,
    FORMAT(CONVERT(DATE, VisitDate), 'dd.MM.yyyy') AS VisitDate,
    LOWER(Stage) AS Stage,
    Action,
    Duration
from dbo.customer_journey