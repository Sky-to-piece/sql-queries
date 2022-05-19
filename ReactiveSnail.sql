--for Mysql DBMS

CREATE DATABASE ReactiveSnail;

USE ReactiveSnail;

CREATE TABLE DRIVER(
    ID INT PRIMARY KEY AUTO_INCREMENT 		NOT NULL,
    LASTNAME   			VARCHAR(255) 	NOT NULL,
    FIRSTNAME			VARCHAR(255) 	NOT NULL,
    PATRONYMIC 			VARCHAR(255),
    YEAR_OF_BIRTH 		DATE		NOT NULL,
    DATE_OF_EMPLOYMENT 		DATE		NOT NULL,
    DRIVING_EXPERIENCE		DATE		NOT NULL,
    PHOTO 			VARCHAR(255)    DEFAULT '/photo/ava_default.png'
	);

INSERT INTO DRIVER (LASTNAME, FIRSTNAME, PATRONYMIC, YEAR_OF_BIRTH, DATE_OF_EMPLOYMENT, DRIVING_EXPERIENCE, PHOTO)
VALUES ("Ivanov", "Ivan", "Ivanovich", '1995.03.03', '2016.03.03', '2015.03.09', "/photo/IvanII.png");

CREATE TABLE TRANSPORT_REFERENCES(
    ID INT PRIMARY KEY AUTO_INCREMENT 	    NOT NULL,
    TYPE_TRAN_REF           VARCHAR(255)    NOT NULL,
    CAR_MODEL               VARCHAR(255)    NOT NULL,
    STATUS_TRAN_REF         VARCHAR(255)    NOT NULL,
    DATE_OF_REGISTRATION    DATE            NOT NULL,
    DATE_OF_DE_REGISTRATION DATE
    );

INSERT INTO TRANSPORT_REFERENCES (TYPE_TRAN_REF, CAR_MODEL, STATUS_TRAN_REF, DATE_OF_REGISTRATION)
VALUES ("Passenger car", "LADA Granta", "Active", '2016.03.03');

CREATE TABLE DRIVER_TRAN_REF(
    ID INT PRIMARY KEY AUTO_INCREMENT 	NOT NULL,
    ID_DRIVER       INT                 NOT NULL,
    ID_TRAN_REF     INT                 NOT NULL,
    FOREIGN KEY (ID_DRIVER)   REFERENCES DRIVER(ID), --many-to-many
    FOREIGN KEY (ID_TRAN_REF) REFERENCES TRANSPORT_REFERENCES(ID) --many-to-many
    );

INSERT INTO DRIVER_TRAN_REF (ID_DRIVER, ID_TRAN_REF) VALUES ('1', '1');
