USE littlelemondb;

INSERT INTO customers
    (CustomerID, FullName, PhoneNumber, Email)
VALUES
    (1, 'Carlos Hernandez', '+503 7012 3456', 'carlos.hernandez@example.com'),
    (2, 'María González', '+503 7123 4567', 'maria.gonzalez@example.com'),
    (3, 'José Martínez', '+503 7234 5678', 'jose.martinez@example.com'),
    (4, 'Ana Rodríguez', '+503 7345 6789', 'ana.rodriguez@example.com'),
    (5, 'Luis Alberto Flores', '+503 7456 7890', 'luis.flores@example.com');
    
    INSERT INTO menus
    (MenuID, MenuName, Cuisine)
VALUES
    (1, 'Salvadoran Classics', 'Salvadoran'),
    (2, 'Salvadoran Favorites', 'Salvadoran'),
    (3, 'Street Food', 'Salvadoran'),
    (4, 'Traditional Drinks', 'Salvadoran'),
    (5, 'Salvadoran Desserts', 'Salvadoran');
    
    INSERT INTO menuitems
    (ItemID, ItemName, Category, MenuID)
VALUES
    (1,  'Pupusa Revueltas',       'Main',    1),
    (2,  'Pupusa de Queso',        'Main',    1),
    (3,  'Pupusa de Frijol',       'Main',    1),
    (4,  'Panes con Pollo',        'Main',    2),
    (5,  'Yuca Frita',              'Starter', 2),
    (6,  'Sopa de Res',             'Main',    2),
    (7,  'Pastelitos de Carne',     'Main',    3),
    (8,  'Enchiladas Salvadoreñas','Main',    3),
    (9,  'Horchata de Morro',       'Drink',   4),
    (10, 'Kolashampan',              'Drink',   4),
    (11, 'Tamarindo',               'Drink',   4),
    (12, 'Quesadilla Salvadoreña',  'Dessert', 5),
    (13, 'Nuégados de Yuca',        'Dessert', 5),
    (14, 'Torrejas',                'Dessert', 5),
    (15, 'Plátanos Fritos',         'Dessert', 5);
    
    INSERT INTO staff
    (StaffID, Role, Salary)
VALUES
    (1, 'Manager',      2800.00),
    (2, 'Chef',         2400.00),
    (3, 'Waiter',       1500.00),
    (4, 'Cashier',      1450.00),
    (5, 'Delivery',     1600.00);
    
    INSERT INTO bookings
    (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
    (1, '2026-08-18', 4, 1),
    (2, '2026-08-19', 7, 2),
    (3, '2026-08-20', 2, 3),
    (4, '2026-08-21', 6, 4),
    (5, '2026-08-22', 9, 5);
    
    INSERT INTO orders
    (OrderID, OrderDate, Quantity, TotalCost, CustomerID, MenuID)
VALUES
    (1,  '2026-08-10', 4,  180.00, 1, 1),
    (2,  '2026-08-11', 1,   45.00, 2, 2),
    (3,  '2026-08-11', 3,  165.00, 3, 1),
    (4,  '2026-08-12', 5,  220.00, 4, 3),
    (5,  '2026-08-12', 2,   85.00, 5, 4),
    (6,  '2026-08-13', 4,  195.00, 1, 2),
    (7,  '2026-08-14', 1,   35.00, 2, 5),
    (8,  '2026-08-14', 3,  155.00, 3, 3),
    (9,  '2026-08-15', 6,  270.00, 4, 1),
    (10, '2026-08-16', 2,  120.00, 5, 2);
    
    INSERT INTO orderdeliverystatus
    (DeliveryID, OrderID, DeliveryDate, Status)
VALUES
    (1,  1,  '2026-08-10', 'Delivered'),
    (2,  2,  '2026-08-11', 'Delivered'),
    (3,  3,  '2026-08-11', 'Delivered'),
    (4,  4,  '2026-08-12', 'Out for delivery'),
    (5,  5,  '2026-08-12', 'Delivered'),
    (6,  6,  '2026-08-13', 'Preparing'),
    (7,  7,  '2026-08-14', 'Delivered'),
    (8,  8,  '2026-08-14', 'Out for delivery'),
    (9,  9,  '2026-08-15', 'Preparing'),
    (10, 10, '2026-08-16', 'Delivered');
    
SELECT * FROM customers;
SELECT * FROM menus;
SELECT * FROM menuitems;
SELECT * FROM staff;
SELECT * FROM bookings;
SELECT * FROM orders;
SELECT * FROM orderdeliverystatus;

SELECT
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost
FROM customers c
JOIN orders o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;

SELECT
    m.MenuID,
    m.MenuName,
    mi.ItemID,
    mi.ItemName,
    mi.Category
FROM menus m
JOIN menuitems mi
    ON m.MenuID = mi.MenuID
ORDER BY m.MenuID, mi.ItemID;

SELECT
    o.OrderID,
    o.TotalCost,
    ods.DeliveryDate,
    ods.Status
FROM orders o
JOIN orderdeliverystatus ods
    ON o.OrderID = ods.OrderID
ORDER BY o.OrderID;