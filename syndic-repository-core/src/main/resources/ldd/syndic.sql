/**
 * @author LYES KHERBICHE
 */
/**
 * SQL Sqript 
 */

CREATE  TABLE USERS (
  USERNAME VARCHAR(45) NOT NULL ,
  PASSWORD VARCHAR(45) NOT NULL ,
  ENABLED TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (USERNAME)
  );
  
CREATE TABLE USERROLE (
  USERROLEID int(11) NOT NULL AUTO_INCREMENT,
  USERNAME varchar(45) NOT NULL,
  ROLE varchar(45) NOT NULL,
  PRIMARY KEY (USERROLEID),
  UNIQUE KEY uni_username_role (ROLE,USERNAME),
  KEY fk_username_idx (USERNAME),
  CONSTRAINT fk_username FOREIGN KEY (USERNAME) REFERENCES USERS (USERNAME));
  
CREATE TABLE EVENT (
     eventName CHAR(45) NOT NULL,
     typeEvent CHAR(45) NOT NULL,
     dateEvent CHAR(10) NOT NULL,
     descEvent CHAR(45) NOT NULL,
     PRIMARY KEY (eventName)
);

CREATE TABLE ADDRESS (
  NUMADRESS   VARCHAR(45) NOT NULL,
  TYPEADDRESS VARCHAR(45) NOT NULL,
  STREET      VARCHAR(45) NOT NULL,
  CITY        VARCHAR(45) NOT NULL,
  ZIPCODE     VARCHAR(45) NOT NULL,
  COUNTRY     VARCHAR(45) NOT NULL,
  PLACENAME   VARCHAR(45) NOT NULL,
  CONSTRAINT PK_ADDRESS PRIMARY KEY (NUMADRESS, TYPEADDRESS, STREET, CITY, ZIPCODE, COUNTRY)
);

CREATE TABLE USERDATA (
  FIRSTNAME   VARCHAR(45) NOT NULL,
  LASTNAME    VARCHAR(45) NOT NULL,
  PHONE       VARCHAR(45)         ,
  BIRTHDAY    VARCHAR(45) NOT NULL,
  MOBILE      VARCHAR(45)         ,
  EMAIL       VARCHAR(45)         ,
  NUMADRESS   VARCHAR(45) NOT NULL,
  TYPEADDRESS VARCHAR(45) NOT NULL,
  STREET      VARCHAR(45) NOT NULL,
  CITY        VARCHAR(45) NOT NULL,
  ZIPCODE     VARCHAR(45) NOT NULL,
  COUNTRY     VARCHAR(45) NOT NULL,
  USERS       VARCHAR(45) NOT NULL,
  CONSTRAINT PK_USERDATA PRIMARY KEY (FIRSTNAME, LASTNAME, BIRTHDAY),
  CONSTRAINT FK_USERDATA_USERS FOREIGN KEY (USERS) REFERENCES USERS (USERNAME),
  CONSTRAINT FK_USERDATA_ADDRESS FOREIGN KEY (NUMADRESS, TYPEADDRESS, STREET, CITY, ZIPCODE, COUNTRY) REFERENCES ADDRESS (NUMADRESS, TYPEADDRESS, STREET, CITY, ZIPCODE, COUNTRY)
);
  
INSERT INTO USERS(username,password,enabled)
VALUES ('alex','123456', true);

INSERT INTO USERROLE (username, role)
VALUES ('alex', 'ROLE_USER');