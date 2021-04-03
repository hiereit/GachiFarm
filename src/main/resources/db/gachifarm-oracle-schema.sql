
CREATE TABLE Account
(
	user_id              INTEGER NOT NULL ,
	loginId              VARCHAR2(20) NULL ,
	password             VARCHAR2(20) NULL ,
	email                VARCHAR2(40) NULL ,
	name                 VARCHAR2(40) NULL ,
	address1             VARCHAR2(200) NULL ,
	address2             VARCHAR2(200) NULL ,
	zip                  VARCHAR2(5) NULL ,
	phone                VARCHAR2(13) NULL 
);

CREATE UNIQUE INDEX XPKAccount ON Account
(user_id   ASC);

ALTER TABLE Account
	ADD CONSTRAINT  XPKAccount PRIMARY KEY (user_id);

CREATE TABLE Administrator
(
	admin_id             INTEGER NOT NULL ,
	user_id              INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKAdministrator ON Administrator
(admin_id   ASC,user_id   ASC);

ALTER TABLE Administrator
	ADD CONSTRAINT  XPKAdministrator PRIMARY KEY (admin_id,user_id);

CREATE TABLE Board
(
	user_id              INTEGER NOT NULL ,
	content              VARCHAR2(2000) NULL 
);

CREATE UNIQUE INDEX XPKBoard ON Board
(user_id   ASC);

ALTER TABLE Board
	ADD CONSTRAINT  XPKBoard PRIMARY KEY (user_id);

CREATE TABLE Category
(
	category_id          INTEGER NOT NULL ,
	name                 VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKCategory ON Category
(category_id   ASC);

ALTER TABLE Category
	ADD CONSTRAINT  XPKCategory PRIMARY KEY (category_id);

CREATE TABLE Chatting
(
	sender_id            INTEGER NULL ,
	product_id           INTEGER NULL ,
	chatting_id          INTEGER NOT NULL ,
	receiver_id          INTEGER NULL 
);

CREATE UNIQUE INDEX XPKChatting ON Chatting
(chatting_id   ASC);

ALTER TABLE Chatting
	ADD CONSTRAINT  XPKChatting PRIMARY KEY (chatting_id);

CREATE TABLE Message
(
	message_id           INTEGER NOT NULL ,
	date                 DATE NULL ,
	imageName            VARCHAR2(100) NULL ,
	imagePath            VARCHAR2(100) NULL ,
	chatting_id          INTEGER NOT NULL ,
	content              VARCHAR2(1000) NULL 
);

CREATE UNIQUE INDEX XPKMessage ON Message
(message_id   ASC,chatting_id   ASC);

ALTER TABLE Message
	ADD CONSTRAINT  XPKMessage PRIMARY KEY (message_id,chatting_id);

CREATE TABLE Order
(
	userName             VARCHAR2(40) NULL ,
	totalPrice           INTEGER NULL ,
	phone                VARCHAR2(13) NULL ,
	orderDate            DATE NULL ,
	billAddress1         VARCHAR2(200) NULL ,
	billAddress2         VARCHAR2(200) NULL ,
	billZip              VARCHAR2(5) NULL ,
	creditNum            VARCHAR2(20) NULL ,
	expireDate           DATE NULL ,
	cardType             VARCHAR2(20) NULL ,
	status               INTEGER NULL ,
	order_id             INTEGER NOT NULL ,
	user_id              INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKOrder ON Order
(order_id   ASC,user_id   ASC);

ALTER TABLE Order
	ADD CONSTRAINT  XPKOrder PRIMARY KEY (order_id,user_id);

CREATE TABLE LineItem
(
	order_id             INTEGER NOT NULL ,
	lineNumber           INTEGER NOT NULL ,
	quantity             INTEGER NULL ,
	unitPrice            INTEGER NULL ,
	product_id           INTEGER NULL ,
	user_id              INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKLineItem ON LineItem
(order_id   ASC,lineNumber   ASC,user_id   ASC);

ALTER TABLE LineItem
	ADD CONSTRAINT  XPKLineItem PRIMARY KEY (order_id,lineNumber,user_id);

CREATE TABLE Product
(
	product_id           INTEGER NOT NULL ,
	price                INTEGER NULL ,
	name                 VARCHAR2(100) NULL ,
	category_id          INTEGER NOT NULL ,
	origin               VARCHAR2(100) NULL ,
	supplier             VARCHAR2(40) NULL ,
	unit                 VARCHAR2(40) NULL ,
	status               INTEGER NULL ,
	quantity             INTEGER NULL ,
	imagePath            VARCHAR2(100) NULL ,
	imageName            VARCHAR2(100) NULL ,
	description          VARCHAR2(4000) NULL ,
	user_id              INTEGER NULL ,
	saleType_id          INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKProduct ON Product
(product_id   ASC);

ALTER TABLE Product
	ADD CONSTRAINT  XPKProduct PRIMARY KEY (product_id);

CREATE TABLE Review
(
	review_id            INTEGER NOT NULL ,
	title                VARCHAR2(60) NULL ,
	user_id              INTEGER NULL ,
	date                 DATE NULL ,
	score                FLOAT NULL ,
	content              VARCHAR2(2000) NULL ,
	product_id           INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKReview ON Review
(review_id   ASC,product_id   ASC);

ALTER TABLE Review
	ADD CONSTRAINT  XPKReview PRIMARY KEY (review_id,product_id);

CREATE TABLE Cart
(
	user_id              INTEGER NOT NULL ,
	product_id           INTEGER NOT NULL ,
	quantity             INTEGER NULL ,
	check                SMALLINT NULL 
);

CREATE UNIQUE INDEX XPKCart ON Cart
(user_id   ASC,product_id   ASC);

ALTER TABLE Cart
	ADD CONSTRAINT  XPKCart PRIMARY KEY (user_id,product_id);

CREATE TABLE SaleType
(
	saleType_id          INTEGER NOT NULL ,
	name                 VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKSaleType ON SaleType
(saleType_id   ASC);

ALTER TABLE SaleType
	ADD CONSTRAINT  XPKSaleType PRIMARY KEY (saleType_id);

ALTER TABLE Administrator
	ADD (CONSTRAINT R_26 FOREIGN KEY (user_id) REFERENCES Account (user_id));

ALTER TABLE Message
	ADD (CONSTRAINT R_29 FOREIGN KEY (chatting_id) REFERENCES Chatting (chatting_id));

ALTER TABLE Order
	ADD (CONSTRAINT R_21 FOREIGN KEY (user_id) REFERENCES Account (user_id));

ALTER TABLE LineItem
	ADD (CONSTRAINT R_19 FOREIGN KEY (order_id, user_id) REFERENCES Order (order_id, user_id));

ALTER TABLE Product
	ADD (CONSTRAINT R_22 FOREIGN KEY (category_id) REFERENCES Category (category_id));

ALTER TABLE Product
	ADD (CONSTRAINT R_23 FOREIGN KEY (saleType_id) REFERENCES SaleType (saleType_id));

ALTER TABLE Review
	ADD (CONSTRAINT R_14 FOREIGN KEY (product_id) REFERENCES Product (product_id));

ALTER TABLE Cart
	ADD (CONSTRAINT R_15 FOREIGN KEY (product_id) REFERENCES Product (product_id));
