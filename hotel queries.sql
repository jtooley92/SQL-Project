USE hoteldata;

-- Write a query that returns a list of reservations that end in July 2023,
-- including the name of the guest, the room number(s),
-- and the reservation dates.

SELECT 
	r.Name,
    r.EndDate,
    rr.RoomNumber
FROM Reservation r
INNER JOIN ReservationRoom rr ON r.ReservationId = rr.ReservationId
WHERE r.EndDate LIKE '2023-07%';
    
-- Write a query that returns a list of all reservations for rooms with a jacuzzi,
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT 
	r.Name,
    rr.RoomNumber,
    r.StartDate,
    r.EndDate
FROM Reservation r
INNER JOIN ReservationRoom rr ON r.ReservationId = rr.ReservationId
INNER JOIN RoomAmenity ra on rr.RoomNumber = ra.RoomNumber
INNER JOIN Amenity a on ra.AmenityId = a.AmenityId
WHERE a.AmenityId = 3;

-- Write a query that returns all the rooms reserved for a specific guest,
-- including the guest's name, the room(s) reserved, the starting date of the reservation,
-- and how many people were included in the reservation.
-- (Choose a guest's name from the existing data.)

SELECT 
	r.NAME,
    rr.RoomNumber,
    r.StartDate,
    r.Adult + r.Child TotalGuest
FROM Reservation r 
INNER JOIN ReservationRoom rr ON r.ReservationId = rr.ReservationId
WHERE r.Name = 'Mack Simmer';

-- Write a query that returns a list of rooms, reservation ID,
-- and per-room cost for each reservation. The results should include all rooms,
-- whether or not there is a reservation associated with the room.

SELECT 
	o.RoomNumber,
    rr.ReservationId,
    rt.BaseRoomPrice
FROM Room o
LEFT OUTER JOIN ReservationRoom rr ON o.RoomNumber = rr.RoomNumber
LEFT OUTER JOIN RoomType rt ON o.RoomTypeId = rt.RoomTypeId
ORDER BY o.RoomNumber;

-- Write a query that returns all the rooms accommodating at least
-- three guests and that are reserved on any date in April 2023.

SELECT 
	o.RoomNumber,
    r.StartDate
FROM Room o
INNER JOIN ReservationRoom rr On o.RoomNumber = rr.RoomNumber
INNER JOIN Reservation r ON rr.ReservationId = r.ReservationId
WHERE (o.RoomTypeId = 2 OR o.RoomTypeId = 3) AND r.StartDate LIKE '2023-04%';

-- Write a query that returns a list of all guest names and the number of reservations per guest,
-- sorted starting with the guest with the most reservations and then by the guest's last name.

SELECT 
	r.Name,
    COUNT(r.ReservationId) NumberOfReservation
FROM Reservation r
GROUP BY r.Name
ORDER BY COUNT(r.ReservationId) DESC;

-- Write a query that displays the name, address, and phone number of a guest
-- based on their phone number. (Choose a phone number from the existing data.)
SELECT 
	g.FirstName,
    g.LastName,
    g.Address,
    g.PhoneNumber
FROM Guest g
WHERE g.PhoneNumber = '5555555555';