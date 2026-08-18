USE littlelemondb;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM bookings;
SELECT * FROM bookings;

INSERT INTO bookings
    (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);
    
SELECT *
FROM bookings
ORDER BY BookingID;