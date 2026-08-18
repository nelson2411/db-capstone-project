USE littlelemondb;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN BookingIDInput INT,
    IN CustomerIDInput INT,
    IN TableNumberInput INT,
    IN BookingDateInput DATE
)
BEGIN
    INSERT INTO bookings
        (BookingID, CustomerID, TableNumber, BookingDate)
    VALUES
        (BookingIDInput,
         CustomerIDInput,
         TableNumberInput,
         BookingDateInput);

    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;

CALL AddBooking(9, 3, 4, '2022-12-30');

SELECT *
FROM bookings
WHERE BookingID = 9;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN BookingIDInput INT,
    IN BookingDateInput DATE
)
BEGIN
    UPDATE bookings
    SET BookingDate = BookingDateInput
    WHERE BookingID = BookingIDInput;

    SELECT CONCAT(
        'Booking ',
        BookingIDInput,
        ' updated'
    ) AS Confirmation;
END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');

SELECT *
FROM bookings
WHERE BookingID = 9;

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN BookingIDInput INT
)
BEGIN
    DELETE FROM bookings
    WHERE BookingID = BookingIDInput;

    SELECT CONCAT(
        'Booking ',
        BookingIDInput,
        ' canceled'
    ) AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);

SELECT *
FROM bookings
WHERE BookingID = 9;
