CREATE TABLE Mechanic (
    MechanicID int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255),
    PhoneNbr int NOT NULL,
    PRIMARY KEY (MechanicID)
)
CREATE TABLE Client (
    PersonalIDNbr int NOT NULL,
    FirstName varchar(255),
    LastName varchar(255) NOT NULL,
    PhoneNbr int NOT NULL,
    Email varchar(255),
    Address varchar(255),
    PRIMARY KEY (PersonalIDNbr)
)
CREATE TABLE Part (
    PartID int NOT NULL,
    Name varchar(255),
    Price int NOT NULL,
    InStock int,
    PRIMARY KEY (PartID)
)
--DROP TABLE Mechanic

CREATE TABLE Orders (
    OrderID int NOT NULL,
    StartDate date,
    EndDate date,
    MechanicID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
)

CREATE TABLE Car (
    RegistrationNbr int NOT NULL,
    Brand varchar(255),
    Model varchar(255),
    ProductionYear, int,
    Mileage int,
    PersonalIDNbr int,
    PRIMARY KEY (RegistrationNbr),
    FOREIGN KEY (PersonalIDNbr) REFERENCES Client(PersonalIDNbr
)
