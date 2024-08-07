CREATE DATABASE mcdo;
USE mcdo;
CREATE TABLE User(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT,RoleID int,CartID INT
);

CREATE TABLE Role(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    priority INT NOT NULL
);

CREATE TABLE Cart(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Category(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT
);

CREATE TABLE Product(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT,price FLOAT,CategoryID INT
);

CREATE TABLE Commande(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    UserID INT
);

CREATE TABLE Sale(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    priceHT FLOAT,
    priceTTC FLOAT,
    CommandeID INT
);

CREATE TABLE ProductCart(
    ProductID INT NOT NULL,
    CartID INT NOT NULL, 
    CONSTRAINT FK_ProductCart_PRODUCT FOREIGN KEY(ProductID) REFERENCES Product(id),
    CONSTRAINT FK_ProductCart_CART FOREIGN KEY(CartID) REFERENCES Cart(id),
    PRIMARY KEY(ProductID,CartID)
);

CREATE TABLE ProductCommande(
    ProductID INT NOT NULL,
    CommandeID INT NOT NULL, 
    CONSTRAINT FK_ProductCommande_PRODUCT FOREIGN KEY(ProductID) REFERENCES Product(id),
    CONSTRAINT FK_ProductCommande_Commande FOREIGN KEY(CommandeID) REFERENCES Commande(id),
    PRIMARY KEY(ProductID,CommandeID)
);


ALTER TABLE User ADD FOREIGN KEY (RoleID) REFERENCES Role(id);
ALTER TABLE Product ADD FOREIGN KEY (CategoryID) REFERENCES Category(id);
ALTER TABLE User ADD FOREIGN KEY (CartID) REFERENCES Cart(id);
ALTER TABLE Commande ADD FOREIGN KEY (UserID) REFERENCES User(id);
ALTER TABLE Sale ADD FOREIGN KEY (CommandeID) REFERENCES Commande(id);