DROP TABLE IF EXISTS DISH CASCADE;
CREATE TABLE DISH(
    ID INTEGER AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    PRICE DOUBLE NOT NULL
);
ALTER TABLE DISH ADD CONSTRAINT CONSTRAINT_DISH_PK PRIMARY KEY(ID);

DROP TABLE IF EXISTS RESTAURANT CASCADE;
CREATE TABLE RESTAURANT(
    ID INTEGER AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL
);
ALTER TABLE RESTAURANT ADD CONSTRAINT CONSTRAINT_RESTAURANT_PK PRIMARY KEY(ID);

DROP TABLE IF EXISTS MENU CASCADE;
CREATE TABLE MENU(
    ID INTEGER AUTO_INCREMENT,
    DATE DATE NOT NULL,
    RESTAURANT_ID INTEGER NOT NULL
);
ALTER TABLE MENU ADD CONSTRAINT CONSTRAINT_MENU_PK PRIMARY KEY(ID);
ALTER TABLE MENU ADD CONSTRAINT CONSTRAINT_MENU_RESTAURANT_ID_DATE UNIQUE(RESTAURANT_ID, DATE);
ALTER TABLE MENU ADD CONSTRAINT CONSTRAINT_MENU_RESTAURANT_ID FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(ID);

DROP TABLE IF EXISTS MENU_DISHES CASCADE;
CREATE TABLE MENU_DISHES(
    MENU_ID INTEGER NOT NULL,
    DISHES_ID INTEGER NOT NULL
);
ALTER TABLE MENU_DISHES ADD CONSTRAINT CONSTRAINT_MENU_DISHES_MENU_ID FOREIGN KEY(MENU_ID) REFERENCES MENU(ID);
ALTER TABLE MENU_DISHES ADD CONSTRAINT CONSTRAINT_MENU_DISHES_DISHES_ID FOREIGN KEY(DISHES_ID) REFERENCES DISH(ID);

DROP TABLE IF EXISTS USER CASCADE;
CREATE TABLE USER(
    ID INTEGER AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ROLE VARCHAR(255)
);
ALTER TABLE USER ADD CONSTRAINT CONSTRAINT_USER_PK PRIMARY KEY(ID);
ALTER TABLE USER ADD CONSTRAINT CONSTRAINT_USER_NAME UNIQUE(NAME);

DROP TABLE IF EXISTS VOTE CASCADE;
CREATE TABLE VOTE(
    ID INTEGER AUTO_INCREMENT,
    DATE DATE NOT NULL,
    RESTAURANT_ID INTEGER NOT NULL,
    USER_ID INTEGER NOT NULL
);
ALTER TABLE VOTE ADD CONSTRAINT CONSTRAINT_VOTE_ID PRIMARY KEY(ID);
ALTER TABLE VOTE ADD CONSTRAINT CONSTRAINT_VOTE_RESTAURANT_ID_DATE_USER_ID UNIQUE(RESTAURANT_ID, DATE, USER_ID);
ALTER TABLE VOTE ADD CONSTRAINT CONSTRAINT_VOTE_RESTAURANT_ID FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(ID);
ALTER TABLE VOTE ADD CONSTRAINT CONSTRAINT_VOTE_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER(ID);
