USE littlelemondb;

CREATE VIEW OrdersView AS
SELECT
    OrderID,
    Quantity,
    TotalCost AS Cost
FROM orders
WHERE Quantity > 2;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SELECT *
FROM OrdersView;

SHOW CREATE VIEW OrdersView;

/**** Task TWO ****/

SELECT
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost AS Cost,
    m.MenuName,
    mi.ItemName,
    mi.Category
FROM customers AS c
JOIN orders AS o
    ON c.CustomerID = o.CustomerID
JOIN menus AS m
    ON o.MenuID = m.MenuID
JOIN menuItems AS mi
    ON m.MenuID = mi.MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

