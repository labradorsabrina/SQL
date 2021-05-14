CREATE DATABASE db_librayManagement1;

DROP DATABASE db_librayManagement1;

--Statements to allow creation and insertion
USE db_librayManagement1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET IDENTITY_INSERT BORROWER ON

--Table creation with keys 
CREATE TABLE LIBRARY_BRANCH (
    BranchID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    BranchName varchar(50) NOT NULL,
    BranchAddress varchar(50) NOT NULL
);


CREATE TABLE PUBLISHER (
    PublisherName varchar(50) NOT NULL PRIMARY KEY,
    PublisherAddress varchar(50) NOT NULL,
    PhoneNumber INT NOT NULL
);

SELECT * FROM PUBLISHER;


CREATE TABLE BOOKS (
    BookID INT NOT NULL PRIMARY KEY IDENTITY (10,10),
    Title varchar(50) NOT NULL, 
    PublisherName varchar(50) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS (
    BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
    AuthorName varchar(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
    BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
    BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    Number_of_Copies INT NOT NULL
);

CREATE TABLE BORROWER (
    CardNo INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    Borrower_Name varchar(50) NOT NULL,
	Borrower_Address varchar(50) NOT NULL,
	Borrower_Phone INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    CardNo INT FOREIGN KEY REFERENCES BORROWER(CardNo),
    DateOut DATE NOT NULL,
    DateDue DATE NOT NULL
);


SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;
SELECT * FROM BORROWER;

--Insert values into tables
INSERT INTO LIBRARY_BRANCH
		(BranchName, BranchAddress)
		VALUES 
		('Sharpstown', '1112 Maple Drive'),
		('Central', '2738 Pine Way'),
		('Eastland', '3305 Willow Path'),
		('Freeburg', '9006 Oak Street')
	;
	SELECT * FROM LIBRARY_BRANCH;

INSERT INTO PUBLISHER 
		(PublisherName, PublisherAddress, PhoneNumber)
		VALUES 
		('Random House', 'Missouri', 1),
		('Century Hills', 'California', 2)
	;
	SELECT * FROM PUBLISHER;

INSERT INTO BOOKS
		(Title, PublisherName)
		VALUES 
		('The Shining', 'Century Hills'),
		('Pet Sematary', 'Century Hills'),
		('Looking for Alaska', 'Random House'),
		('The Hunger Games', 'Random House'),
		('Catching Fire', 'Random House'),
		('Mocking Jay', 'Random House'),
		('Divergent', 'Century Hills'),
		('Paper Towns', 'Random House'),
		('The Lost Tribe', 'Century Hills'),
		('The Great Gatsby', 'Random House'),
		('To Kill a Mockingbird', 'Random House'),
		('The Book Theif', 'Random House'),
		('Perks of being a Wallflower', 'Century Hills'),
		('The Woman in Cabin 10', 'Random House'),
		('Persepolis', 'Random House'),
		('All The Bright Places', 'Century Hills'),
		('The Glass Castle', 'Random House'),
		('A Man Called Ove', 'Century Hills'),
		('Speak', 'Century Hills'),
		('The Lightning Thief', 'Century Hills'),
		('Tweak', 'Random House')
;
SELECT * FROM BOOKS;

INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (10, 'Stephen King');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (20, 'Stephen King');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (30, 'John Green');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (40, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (50, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (60, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (70, 'Veronica Roth');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (80, 'John Green');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (90, 'Mark Lee');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (100, 'Fitzgerald');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (110, 'Harper Lee');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (120, 'Markus Zusak');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (130, 'Stephen Chbosky');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (140, 'Ruth Ware');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (150, 'Marjane Satrapi');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (160, 'Jennifer Niven');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (170, 'Jeannette Walls');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (180, 'Fredrik Backman');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (190, 'Laurie Halse Anderson');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (200, 'Rick Riordan');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (210, 'Nic Sheff');

;
SELECT * FROM BOOK_AUTHORS;

INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (10, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (20, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (30, 4, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (40, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (50, 4, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (60, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (70, 1, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (80, 1, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (90, 1, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (100, 3, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (110, 3, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (120, 2, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (130, 2, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (140, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (150, 1, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (160, 3, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (170, 3, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (180, 4, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (190, 2, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (200, 1, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (210, 1, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (100, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (100, 3, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (100, 4, 3);

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;


INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 2, 1, '2019-01-01', '2019-01-07');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 2, 1, '2019-01-01', '2019-01-07');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (30, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (40, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (50, 4, 6, '2019-03-14', '2019-03-21');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (70, 1, 6, '2019-03-14', '2019-03-21');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 4, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 3, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (210, 1, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (90, 1, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (60, 2, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (80, 4, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 3, 6, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (90, 3, 6, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 1, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (30, 4, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (150, 2, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 4, 8, '2019-03-17', '2019-03-24');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 2, 2, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (50, 4, 2, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (70, 4, 2, '2019-02-20', '2019-02-27');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 3, 2, '2019-02-20', '2019-02-27');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (30, 1, 2, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (70, 1, 2, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 2, 3, '2019-02-22', '2019-03-01');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (60, 4, 3, '2019-02-22', '2019-03-01');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 3, 5, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (130, 3, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (150, 1, 5, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (210, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (200, 2, 5, '2019-01-03', '2019-01-10');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (50, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (80, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 3, 5, '2019-04-04', '2019-04-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (190, 1, 5, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (90, 2, 5, '2019-01-03', '2019-01-10');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (20, 3, 5, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (60, 4, 9, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (30, 4, 9, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (70, 1, 9, '2019-04-05', '2019-04-12');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (10, 2, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (40, 4, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (140, 3, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (120, 2, 9, '2019-01-28', '2019-02-04');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (80, 3, 9, '2019-01-28', '2019-02-24');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (60, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (30, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (100, 4, 9, '2019-02-19', '2019-02-26');

SELECT * FROM BORROWER;

INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Alex', 'Main Street', '1');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Quinn', '1111 Sephora Way', '2');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Ashton', '1221 Fire Road', '3');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Meadow', '54th Street', '4');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Nadia', '23rd Street', '5');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Clover', '19th Street', '6');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Dakota', '44 States Lane', '7');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Sage', '43 Windham Corner', '8');
INSERT INTO BORROWER (Borrower_Name, Borrower_Address, Borrower_Phone) VALUES ('Hana', '4204 Right Drive', '9');


--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;

SELECT BOOK_COPIES.Number_of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE LIBRARY_BRANCH.BranchName = 'Sharpstown' AND BOOKS.Title = 'The Lost Tribe';

--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;

SELECT BOOK_COPIES.Number_of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BOOKS.Title = 'The Lost Tribe'; 

--3.) Retrieve the names of all borrowers who do not have any books checked out.

SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;

SELECT BORROWER.Borrower_Name
FROM BORROWER
WHERE NOT EXISTS(SELECT * FROM BOOK_LOANS WHERE BORROWER.CardNo = BOOK_LOANS.CardNo);

--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

SELECT * FROM BORROWER;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_LOANS;

SELECT BOOKS.Title, BORROWER.Borrower_Name, BORROWER.Borrower_Address
FROM BOOK_LOANS
INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID 
INNER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo 
WHERE DateDue = '2019-04-23';


--5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM BOOK_LOANS;

SELECT LIBRARY_BRANCH.BranchName, COUNT(BOOK_LOANS.BranchID)
FROM LIBRARY_BRANCH 
INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
GROUP BY LIBRARY_BRANCH.BranchName;



--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;

SELECT BORROWER.Borrower_Name, BORROWER.Borrower_Address, COUNT(BOOK_LOANS.CardNo) 
FROM BORROWER
INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
GROUP BY Borrower_Name, Borrower_Address
HAVING COUNT(BOOK_LOANS.CardNo) > 5;

--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM LIBRARY_BRANCH;


SELECT BOOKS.Title, BOOK_COPIES.Number_of_Copies
FROM BOOKS
INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BOOK_AUTHORS.AuthorName = 'Stephen King' AND LIBRARY_BRANCH.BranchName = 'Central' 


