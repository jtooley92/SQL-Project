DROP DATABASE IF EXISTS hoteldata;

CREATE DATABASE IF NOT EXISTS hoteldata;

USE hoteldata;

CREATE TABLE Guest(
	GuestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(45) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip CHAR(5) NOT NULL,
    PhoneNumber CHAR(10)
);
    
    CREATE TABLE Reservation(
		ReservationId INT PRIMARY KEY AUTO_INCREMENT,
        Name VARCHAR(45) NOT NULL,
        Adult INT NOT NULL,
        Child INT NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE NOT NULL,
        TotalRoomCost DECIMAL(7,2) NOT NULL,
        GuestId INT NOT NULL,
        FOREIGN KEY fk_Reservation_GuestId (GuestId)
			REFERENCES Guest (GuestId)
);

CREATE TABLE RoomType(
	RoomTypeId INT PRIMARY KEY AUTO_INCREMENT,
    RoomVersion CHAR(6) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaximumOccupancy INT NOT NULL,
    BaseRoomPrice DECIMAL(5,2) NOT NULL,
    ExtraPersonCost DECIMAL(4,2) 
);

CREATE TABLE Room(
	RoomNumber INT PRIMARY KEY,
    AdaAccess TINYINT NOT NULL,
    RoomTypeId INT NOT NULL,
    FOREIGN KEY fk_Room_RoomTypeId (RoomTypeId)
		REFERENCES RoomType (RoomTypeId)
);

CREATE TABLE Amenity(
	AmenityId INT PRIMARY KEY AUTO_INCREMENT,
    AmenityType CHAR(15) NOT NULL,
    AmenityPrice Decimal(4,2)
);

CREATE TABLE ReservationRoom(
	ReservationId Int NOT NULL,
    RoomNumber Int NOT NULL,
    PRIMARY KEY(ReservationId,RoomNumber),
	FOREIGN KEY fk_ReservationRoom_ReservationId (ReservationId)
		REFERENCES Reservation (ReservationId),
	FOREIGN KEY fk_ReservationRoom_RoomNumber (RoomNumber)
		REFERENCES Room (RoomNumber)
);

CREATE TABLE RoomAmenity(
	RoomNumber Int NOT NULL,
    AmenityId Int NOT NULL,
    PRIMARY KEY(RoomNumber, AmenityId),
	FOREIGN KEY fk_RoomAmenity_RoomNumber (RoomNumber)
		REFERENCES Room (RoomNumber),
	FOREIGN KEY fk_RoomAmenity_AmenityId (AmenityId)
		REFERENCES Amenity (AmenityId)
);
    