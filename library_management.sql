-- Creating DataBase
create database library_management
--------------------------------------
-- category Table
create table category (
	category_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,
    category_name varchar(100) NOT NULL,

	category_description varchar(MAX) NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
--------------------------------------
-- Publication Table
create table publication (
	publication_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,
    publication_name varchar(100) NOT NULL,

    publication_book varchar(100) NOT NULL,

	publication_description varchar(MAX) NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
--------------------------------------
-- Borrower Table
create table borrower (
	borrower_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,
    borrower_return_date datetime NOT NULL,

    borrower_name varchar(100) NOT NULL,

	borrower_description varchar(MAX) NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)

--------------------------------------
--------------------------------------
--------------------------------------
--------------------------------------
-- Staff Table
create table staff (
	staff_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,
    staff_status varchar(50) NOT NULL,

	staff_username varchar(200) NOT NULL,
    staff_password varchar(500) NOT NULL,
    staff_last_login datetime NOT NULL,
	staff_first_name varchar(100) NOT NULL,
	staff_last_name varchar(100) NOT NULL,
    staff_email varchar(100) NOT NULL,
	staff_phone_number varchar(11) unique NOT NULL,
	staff_birthdate date NOT NULL,
	staff_age  AS  (datediff(year,staff_birthdate,getdate())),
	staff_national_code varchar(100) unique NOT NULL,
	staff_gender varchar(10) NOT NULL,
	staff_address varchar(MAX) NOT NULL,

    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
--------------------------------------
-- Student Table
create table student (
	student_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,

	student_username varchar(200) NOT NULL,
    student_password varchar(500) NOT NULL,
    student_last_login datetime NOT NULL,
	student_first_name varchar(100) NOT NULL,
	student_last_name varchar(100) NOT NULL,
    student_email varchar(100) NOT NULL,
	student_phone_number varchar(11) unique NOT NULL,
	student_birthdate date NOT NULL,
	student_age  AS  (datediff(year,student_birthdate,getdate())),
	student_national_code varchar(100) unique NOT NULL,
	student_gender varchar(10) NOT NULL,
	student_address varchar(MAX) NOT NULL,

    created_at datetime NOT NULL,
	updated_at datetime NOT NULL
	
)
--------------------------------------
-- Author Table
create table author (
	author_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,

	author_username varchar(200) NOT NULL,
    author_password varchar(500) NOT NULL,
    author_last_login datetime NOT NULL,
	author_first_name varchar(100) NOT NULL,
	author_last_name varchar(100) NOT NULL,
    author_email varchar(100) NOT NULL,
	author_phone_number varchar(11) unique NOT NULL,
	author_birthdate date NOT NULL,
	author_age  AS  (datediff(year,author_birthdate,getdate())),
	author_national_code varchar(100) unique NOT NULL,
	author_gender varchar(10) NOT NULL,
	author_address varchar(MAX) NOT NULL,

    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
--------------------------------------
-- Payment Table
create table payment (
	payment_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,

	student_ID int NOT NULL,
	FOREIGN KEY (student_ID) REFERENCES student(student_ID),

	borrower_description varchar(MAX) NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
--------------------------------------
-- Book Table
create table book (
	book_ID int IDENTITY(1,1)  NOT NULL ,
    book_isbn_GID uniqueidentifier NOT NULL,
    book_title varchar(200) NOT NULL,
    book_genre varchar(100)NOT NULL,
    book_language varchar(100) NOT NULL,
    book_image NVARCHAR(Max) NOT NULL,
    book_publication_year varchar(MAX) NOT NULL,
    book_price float NOT NULL,


	book_description varchar(MAX) NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
	PRIMARY KEY (book_ID),
)
--------------------------------------
--------------------------------------
---------------- bridge tbl ----------------------
--------------------------------------
------------bridge table for book & author tbl-------
create table bridge_book_author (
	book_ID int NOT NULL,
	author_ID int NOT NULL,
	PRIMARY KEY (book_ID, author_ID),

	FOREIGN KEY (book_ID) REFERENCES book(book_ID),
	FOREIGN KEY (author_ID) REFERENCES author(author_ID),
)
--------------------------------------
------------bridge table for book & student tbl-------
create table bridge_book_student (
	book_ID int NOT NULL,
	student_ID int NOT NULL,
	PRIMARY KEY (book_ID, student_ID),

	FOREIGN KEY (book_ID) REFERENCES book(book_ID),
	FOREIGN KEY (student_ID) REFERENCES student(student_ID),
)
--------------------------------------
------------bridge table for book & category tbl-------
create table bridge_book_category (
	book_ID int NOT NULL,
	category_ID int NOT NULL,
	PRIMARY KEY (book_ID, category_ID),

	FOREIGN KEY (book_ID) REFERENCES book(book_ID),
	FOREIGN KEY (category_ID) REFERENCES category(category_ID),
)
--------------------------------------
------------bridge table for book & payment tbl-------
create table bridge_book_payment (
	book_ID int NOT NULL,
	payment_ID int NOT NULL,
	PRIMARY KEY (book_ID, payment_ID),

	FOREIGN KEY (book_ID) REFERENCES book(book_ID),
	FOREIGN KEY (payment_ID) REFERENCES payment(payment_ID),
)