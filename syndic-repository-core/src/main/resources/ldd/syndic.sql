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
     condo INT,
     PRIMARY KEY (eventName),
     CONSTRAINT FK_EVENT FOREIGN KEY (condo) REFERENCES CONDO (ID)
);

CREATE TABLE ADDRESS (
  ID INT NOT NULL auto_increment,
  NUMADRESS   VARCHAR(45) NOT NULL,
  TYPEADDRESS VARCHAR(45) NOT NULL,
  STREET      VARCHAR(45) NOT NULL,
  CITY        VARCHAR(45) NOT NULL,
  ZIPCODE     VARCHAR(45) NOT NULL,
  COUNTRY     VARCHAR(45) NOT NULL,
  PLACENAME   VARCHAR(45) NOT NULL,
  CONSTRAINT PK_ADDRESS PRIMARY KEY (ID)
);

CREATE TABLE LOT (
  ID INT NOT NULL auto_increment,
  NUM INT NOT NULL,
  TYPE  VARCHAR(45) NOT NULL,
  FLOOR INT NOT NULL,
  AREA DOUBLE NOT NULL,
  PART DOUBLE NOT NULL,
  CONSTRAINT PK_LOT PRIMARY KEY (ID)
);

CREATE TABLE CONDO (
   ID INT NOT NULL auto_increment,
   NAME   VARCHAR(45) NOT NULL,
   ADDRESS INT NOT NULL,
   LOT INT NOT NULL,
   AREA DOUBLE NOT NULL,
   CONSTRAINT PK_CONDO PRIMARY KEY (ID),
   CONSTRAINT FK_CONDO1 FOREIGN KEY (ADDRESS) REFERENCES ADDRESS (ID),
   CONSTRAINT FK_CONDO2 FOREIGN KEY (LOT) REFERENCES LOT(ID)
);

CREATE TABLE USERDATA (
  FIRSTNAME   VARCHAR(45) NOT NULL,
  LASTNAME    VARCHAR(45) NOT NULL,
  PHONE       VARCHAR(45)         ,
  BIRTHDAY    VARCHAR(45) NOT NULL,
  MOBILE      VARCHAR(45)         ,
  EMAIL       VARCHAR(45)         ,
  ADDRESS     INT NOT NULL        ,
  USERS       VARCHAR(45)         ,
  CONSTRAINT PK_USERDATA PRIMARY KEY (FIRSTNAME, LASTNAME, BIRTHDAY),
  CONSTRAINT FK_USERDATA_USERS FOREIGN KEY (USERS) REFERENCES USERS (USERNAME),
  CONSTRAINT FK_USERDATA_ADDRESS FOREIGN KEY (ADDRESS) REFERENCES ADDRESS (ID)
);
CREATE TABLE PROVIDER (
  ID INT NOT NULL auto_increment,
  NAMEPROVIDER VARCHAR(45) NOT NULL,
  DESCRIPTION VARCHAR(45),
  DATECREATION VARCHAR(45),
  CONSTRAINT PK_PROVIDER PRIMARY KEY (ID)
);

CREATE TABLE CONTRACT(
  ID INT NOT NULL,
  NAMECONTRACT VARCHAR(45) NOT NULL,
  DATECONTRACT VARCHAR(45) NOT NULL,
  PROVIDER INT NOT NULL,
  CONSTRAINT PK_CONTRACT PRIMARY KEY (ID),
  CONSTRAINT FK_CONTRACT_PROVIDER FOREIGN KEY (PROVIDER) REFERENCES PROVIDER (ID)
);

INSERT INTO USERS(username,password,enabled)
VALUES ('alex','123456', true);

INSERT INTO USERROLE (username, role)
VALUES ('alex', 'ROLE_USER');