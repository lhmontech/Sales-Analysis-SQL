CREATE DATABASE Game_Store;
USE Game_Store;
CREATE TABLE Custumers (
	Custumer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Custumer_Name VARCHAR(120) NOT NULL,
    Custumer_Birthday DATE NOT NULL,
    Custumer_Mail VARCHAR(50)
);

CREATE TABLE Games (
	Game_ID INT PRIMARY KEY AUTO_INCREMENT,
    Game_Name VARCHAR(120) NOT NULL,
    Game_Price DECIMAL(6,2) NOT NULL,
    Game_Genre ENUM('Action', 'Adventure', 'Fight', 'FPS', 'Horror', 'Racing', 'RPG', 'Sports', 'Survivor') NOT NULL
);

CREATE TABLE Orders (
	Order_ID INT PRIMARY KEY AUTO_INCREMENT,
	Custumer_ID INT,
    Order_Date DATETIME NOT NULL,
    FOREIGN KEY (Custumer_ID) REFERENCES Custumers(Custumer_ID)
);

CREATE TABLE Order_Items (
	Order_Items_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Game_ID INT,
    Quantity INT DEFAULT 1,
    Unit_Price DECIMAL(6,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Game_ID) REFERENCES Games(Game_ID)
);