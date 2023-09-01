drop database mechanicshop;
CREATE DATABASE IF NOT EXISTS mechanicShop; 
use MechanicShop;

CREATE TABLE clients (
  IdClient int NOT NULL AUTO_INCREMENT,
  IdVehicle char(7) NOT NULL,
  Fname varchar(15) NOT NULL,
  Minit varchar(3) DEFAULT NULL,
  Lname varchar(20) NOT NULL,
  CPF char(11) NOT NULL,
  PRIMARY KEY (IdClient, IdVehicle),
  UNIQUE KEY unique_cpf_client (CPF),
  UNIQUE KEY unique_vehicle_client (IdVehicle)
);

alter table clients auto_increment=1;

CREATE TABLE clientVehicle(
	LicensePlate char(7) NOT NULL,
    VehicleType enum('Carro', 'Moto', 'Van', 'Caminhão') NOT NULL,
    Color varchar(20),
    VehicleBrand varchar(40),
    CONSTRAINT fk_vehicle_client FOREIGN KEY (LicensePlate) REFERENCES clients (IdVehicle),
    UNIQUE KEY unique_license (LicensePlate)
);

CREATE TABLE orders (
  IdOrder int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  IdOrderClient int DEFAULT NULL,
  OrderDescription varchar(255) NOT NULL,
  ServiceValue float,
  CONSTRAINT fk_order_client FOREIGN KEY (IdOrderClient) REFERENCES clients (IdClient)
);

alter table orders auto_increment=1;

CREATE TABLE payments (
  IdPayerClient int NOT NULL,
  IdPayment int NOT NULL,
  typePayment enum('Boleto','Cartão','Dois cartões','Pix') NOT NULL,
  SecondTypePayment enum('Boleto','Cartão','Dois cartões','Pix') default null,
  OrderValue float NOT NULL,
  limitAvailable float DEFAULT NULL,   
  Installment int default 1,
  PRIMARY KEY (IdPayerClient, IdPayment),
  CONSTRAINT fk_payments_client FOREIGN KEY (IdPayerClient) REFERENCES clients (IdClient),
  CONSTRAINT fk_payments_order FOREIGN KEY (IdPayment) REFERENCES orders (IdOrder),
  CHECK (limitAvailable >= OrderValue)
);

 CREATE TABLE service (
  IdService int NOT NULL PRIMARY KEY,
  TypeService varchar(50),
  ServiceDetails varchar(250),
  CONSTRAINT fk_service_payment FOREIGN KEY (IdService) REFERENCES payments (IdPayment),
  CONSTRAINT fk_service_order FOREIGN KEY (IdService) REFERENCES orders (IdOrder)  
);


CREATE TABLE employee (
  IdEmployee int NOT NULL AUTO_INCREMENT,
  Fname varchar(15) NOT NULL,
  Minit varchar(3) DEFAULT NULL,
  Lname varchar(20) NOT NULL,
  CPF char(11) NOT NULL,
  JobTitle varchar(20) NOT NULL,
  Bdate date NOT NULL,
  Contact char(11),
  Salary float,
  ContractedDate date,
  PRIMARY KEY (IdEmployee),
  UNIQUE KEY unique_cpf_client (CPF)
);

alter table employee auto_increment=1;

CREATE TABLE employeeDependent (
	IdDependent int NOT NULL PRIMARY KEY,
    IdEmployeeDependent int,
    Fname varchar(15) NOT NULL,
	Minit varchar(3) DEFAULT NULL,
	Lname varchar(20) NOT NULL,
    Bdate date NOT NULL,
    CONSTRAINT fk_dependent_employee FOREIGN KEY (IdEmployeeDependent) REFERENCES employee (IdEmployee)
);



CREATE TABLE supplier (
  IdSupplier int NOT NULL AUTO_INCREMENT,
  SocialName varchar(255) NOT NULL,
  CNPJ char(14) NOT NULL,
  Contact char(11) NOT NULL,
  PRIMARY KEY (IdSupplier),
  UNIQUE KEY unique_supplier (CNPJ)
  
);

alter table supplier auto_increment=1;

CREATE TABLE inventory (
  IdInventory int NOT NULL AUTO_INCREMENT,
  IdParts int NOT NULL,
  Quantity int DEFAULT 1000,
  PRIMARY KEY (IdInventory, IdParts),
  CONSTRAINT fk_inventory_supplier FOREIGN KEY (IdInventory) REFERENCES supplier (IdSupplier)
);

alter table inventory add UNIQUE KEY unique_part (IdParts);

CREATE TABLE inventoryLocation (
  IdLinventory int NOT NULL,
  Location varchar(255) NOT NULL,
  PRIMARY KEY (IdLinventory),
  CONSTRAINT fk_inventory_location_product FOREIGN KEY (IdLinventory) REFERENCES Inventory (IdInventory)
);


-- Saber quantas peças/componente cada serviço precisou
CREATE TABLE serviceParts (
  IdServicePart int NOT NULL AUTO_INCREMENT,
  IdService int NOT NULL,
  IdPart int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (IdServicePart),
  CONSTRAINT fk_service_part_service FOREIGN KEY (IdService) REFERENCES service (IdService),
  CONSTRAINT fk_service_part_part FOREIGN KEY (IdPart) REFERENCES inventory (IdParts)
);





