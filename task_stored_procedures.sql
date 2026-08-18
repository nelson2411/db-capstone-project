USE littlelemondb;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS `Max Quantity in Order`
    FROM orders;
END //

DELIMITER ;

CALL GetMaxQuantity();

PREPARE GetOrderDetail
FROM '
    SELECT
        OrderID,
        Quantity,
        TotalCost AS Cost
    FROM orders
    WHERE CustomerID = ?
';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN OrderIDInput INT)
BEGIN
    DELETE FROM orders
    WHERE OrderID = OrderIDInput;
END //

DELIMITER ;

SELECT *
FROM orders
WHERE OrderID = 11;

CALL CancelOrder(11);

INSERT INTO orders
    (OrderID, OrderDate, Quantity, TotalCost, CustomerID, MenuID)
VALUES
    (11, '2026-08-18', 1, 50.00, 5, 2);