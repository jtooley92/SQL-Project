USE hoteldata;

DELETE FROM ReservationRoom
WHERE ReservationId = 8;

DELETE FROM Reservation
WHERE GuestId = 8;

DELETE FROM Guest
WHERE GuestId = 8;