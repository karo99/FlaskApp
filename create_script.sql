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
    Price float NOT NULL,
    InStock int,
    PRIMARY KEY (PartID)
)

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
    ProductionYear int,
    Mileage int,
    PersonalIDNbr int,
    PRIMARY KEY (RegistrationNbr),
    FOREIGN KEY (PersonalIDNbr) REFERENCES Client(PersonalIDNbr)
)

CREATE TABLE Client_Car (
    Client_CarID int NOT NULL,
    PersonalIDNbr int,
    RegistrationNbr int,
    OrderID int,
    PRIMARY KEY (Client_CarID),
    FOREIGN KEY (PersonalIDNbr) REFERENCES Client(PersonalIDNbr),
    FOREIGN KEY (RegistrationNbr) REFERENCES Car(RegistrationNbr),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)
CREATE TABLE MakeOrder (
    MakeOrderID int NOT NULL,
    MakeDate date,
    Price float NOT NULL,
    Status varchar(255),
    Notification boolean,
    Cancelling boolean,
    OrderID int,
    PRIMARY KEY (MakeOrderID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)
CREATE TABLE PartOrder (
    PartOrderID int NOT NULL,
    OrderDate date,
    ReceiveDate date,
    Price float NOT NULL,
    Status varchar(255),
    MechanicID int,
    PartID int,
    PRIMARY KEY (PartOrderID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID),
    FOREIGN KEY (PartID) REFERENCES Part(PartID)
)
CREATE TABLE Orders_Part (
    Orders_PartID int NOT NULL,
    OrderID int,
    PartID int,
    PRIMARY KEY (Orders_PartID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PartID) REFERENCES Part(PartID)
)
