--CREATE DATABASE AliNinoDb

--use AliNinoDb
--CREATE TABLE Categories
--(
--	ID int primary key identity,
--	Title nvarchar(30) not null unique,
--	ParentCategoryId int references Categories(ID),
--	IsDeleted bit not null default(0)
--)

--CREATE TABLE Authors
--(
--	ID int primary key identity,
--	[Name] nvarchar(50) not null,
--	[SurName] nvarchar(50) not null default('XXX'), 
--	IsDeleted bit not null default(0)
--)

--CREATE TABLE PublishingHouses
--(
--	ID int primary key identity,
--	[Name] nvarchar(50) not null unique,
--	IsDeleted bit not null default(0),	
--)

--CREATE TABLE Bindings
--(
--	ID int primary key identity,
--	Title nvarchar(30) not null unique,
--	IsDeleted bit not null default(0)	
--)

--CREATE TABLE Books
--(
--	ID int primary key identity,
--	Title nvarchar(30) not null unique,
--	[Description] nvarchar(250) not null,
--	ActualPrice money not null CHECK(ActualPrice > 0),
--	DiscountPrice money not null CHECK(DiscountPrice > 0),
--	PublishingHouseId int references PublishingHouses(ID),
--	StockCount int not null CHECK(StockCount > 0),
--	ArtcileCode nvarchar(25) not null, ---- unique olup olmayacagindan tam emin olmadim
--	BindingID int references Bindings(ID),
--	Pages int not null CHECK(Pages > 0),
--	CategoryId int references Categories(ID),
--	IsDeleted bit not null default(0)
--)

--CREATE TABLE BooksAuthors
--(
--	ID int primary key identity,
--	BookID int references Books(ID),
--	AuthorID int references Authors(ID)
--)

--CREATE TABLE Genres
--(
--  ID INT PRIMARY KEY IDENTITY,
--  Title nvarchar(30) not null unique,
--  IsDeleted bit not null default(0)	
--)

--CREATE TABLE BooksGenres
--(
-- ID int PRIMARY KEY IDENTITY,
-- BookID int references Books(ID),
-- GenreID int references Genres(ID)
--)

--CREATE TABLE Languages
--(
--  ID INT PRIMARY KEY IDENTITY,
--  Title nvarchar(30) not null unique,
--  IsDeleted bit not null default(0)	
--)

--CREATE TABLE BooksLanguages
--(	
-- ID INT PRIMARY KEY IDENTITY,
-- BookID int references Books(ID),
-- LanguageID int references Languages(ID)
--)


--CREATE TABLE Comments
--(
--	ID INT PRIMARY KEY IDENTITY,
--  [Description] nvarchar(250),
--	BookID int references Books(ID),
--	Rating tinyint not null check(Rating >= 0 and Rating <= 5),
--	[Name] nvarchar(50) not null,
--	[Email] nvarchar(max) not null,
--	IsDeleted bit not null default(0)
--)

--alter table Comments
--add ImageUrl nvarchar(max)



/* *** Task 1 *** */
--CREATE PROC usp_InsertAll(@CategorieTitle nvarchar(30),@ParentCategoryId int,@BookTitle nvarchar(30),@BookDescription nvarchar(250),@BookActualPrice money,@BookDiscountPrice money,@PublishingHouseId int,@StockCount int,@ArtcileCode nvarchar(25),@BindingId int, @Page int,@CategoryId int,@AuthorName nvarchar(50),@AuthorSurname nvarchar(50),@BookId int,@BookAuthorAuthorID int,@PublishingHouseTitle nvarchar(30),@BookGenreGenreID int,@GenreTitle nvarchar(30),@BindingTitle nvarchar(30),@LanguageTitle nvarchar(30),@BookLanguageLangueageID int,@CommentDescription nvarchar(250),@CommentRating tinyint,@CommentName nvarchar(50),@CommentEmail nvarchar(max),@CommentImageUrl nvarchar(max))
--As
--Begin 
--  insert into Categories(Title,ParentCategoryId)
--  values(@CategorieTitle,@ParentCategoryId)

--  insert into PublishingHouses(Name)
--  values(@PublishingHouseTitle)
  
  
--  insert into Bindings(Title)
--  values(@BindingTitle)
  
--  insert into Books(Title, Description, ActualPrice, DiscountPrice,PublishingHouseId, StockCount, ArtcileCode, BindingId, Pages, CategoryId)
--  values(@BookTitle,@BookDescription,@BookActualPrice,@BookDiscountPrice,@PublishingHouseId,@StockCount,@ArtcileCode,@BindingId,@Page,@CategoryId)
  
--  insert into Authors(Name, Surname)
--	values(@AuthorName,@AuthorSurname)
    
--	insert into BooksAuthors(BookId,AuthorId)
--	values(@BookId,@BookAuthorAuthorID)

--  insert into Genres(Title)
--  values(@GenreTitle)
  
--  insert into BooksGenres(BookId,GenreId)
--  values(@BookId,@BookGenreGenreID)

--  insert into Languages(Title)
--  values(@LanguageTitle)
  
--  insert into BooksLanguages(BookId, LanguageID)
--  values(@BookId,@BookLanguageLangueageID)

--  insert into Comments( Description,BookId,Rating,Name,Email,ImageUrl)
--  values(@CommentDescription,@BookId,@CommentRating,@CommentName,@CommentEmail,@CommentImageUrl)
--End


--usp_InsertAll
--    @CategorieTitle = N'CATEGORY_TITLE',
--    @ParentCategoryId = 1,
--    @BookTitle = N'BOOK_TITLE',
--    @BookDescription = N'BOOK_DESCRIPTION',
--    @BookActualPrice = 99.99,
--    @BookDiscountPrice = 79.99,
--    @PublishingHouseId = 1,
--    @StockCount = 10,
--    @ArtcileCode = N'ARTICLE_CODE',
--    @BindingId = 1,
--    @Page = 200,
--	 @BookId = 1,
--    @CategoryId = 1,
--    @AuthorName = N'AUTHOR_NAME',
--    @AuthorSurname = N'AUTHOR_SURNAME',
--    @BookAuthorAuthorID = 1,
--    @PublishingHouseTitle = N'PUBLISHING_HOUSE_TITLE',
--    @BookGenreGenreID = 1,
--    @GenreTitle = N'GENRE_TITLE',
--    @BindingTitle = N'BINDING_TITLE',
--    @LanguageTitle = N'LANGUAGE_TITLE',
--    @BookLanguageLangueageID = 1,
--    @CommentDescription = N'COMMENT_DESCRIPTION',
--    @CommentRating = 5,
--    @CommentName = N'COMMENT_NAME',
--    @CommentEmail = N'comment@example.com',
--    @CommentImageUrl = N'imageurl.jpg';


--create function dbo.AllTableID(@Id int)
--returns bit
--as
--begin 
--	declare @Result bit = 0;
--	 if EXISTS (select  * from Categories,Authors,PublishingHouses,Bindings,Books,BooksAuthors,Genres,BooksGenres,Languages where Categories.ID = @Id and Authors.ID= @Id and PublishingHouses.ID = @Id and Bindings.ID = @Id and Books.ID= @Id and BooksAuthors.ID = @Id and Genres.ID = @Id and BooksGenres.ID = @Id and Languages.ID = @Id)
--	  set @Result = 1

--	  return @Result
--end


--CREATE PROCEDURE usp_UpdateAll
--(
--    @ID INT,
--    @CategorieTitle NVARCHAR(30),
--    @ParentCategoryId INT,
--    @BookTitle NVARCHAR(30),
--    @BookDescription NVARCHAR(250),
--    @BookActualPrice MONEY,
--    @BookDiscountPrice MONEY,
--    @PublishingHouseId INT,
--    @StockCount INT,
--    @ArtcileCode NVARCHAR(25),
--    @BindingId INT,
--    @Page INT,
--    @CategoryId INT,
--    @AuthorName NVARCHAR(50),
--    @AuthorSurname NVARCHAR(50),
--    @BookAuthorBookId INT,
--    @BookAuthorAuthorID INT,
--    @PublishingHouseTitle NVARCHAR(30),
--    @BookGenreBookID INT,
--    @BookGenreGenreID INT,
--    @GenreTitle NVARCHAR(30),
--    @BindingTitle NVARCHAR(30),
--    @LanguageTitle NVARCHAR(30),
--    @BookLanguageBookID INT,
--    @BookLanguageLangueageID INT,
--    @CommentDescription NVARCHAR(250),
--    @CommentBookId INT,
--    @CommentRating TINYINT,
--    @CommentName NVARCHAR(50),
--    @CommentEmail NVARCHAR(MAX),
--    @CommentImageUrl NVARCHAR(MAX)
--)
--AS
--BEGIN
--    IF dbo.AllTableID(@ID) = 1
--    BEGIN
--        UPDATE Categories
--        SET Title = @CategorieTitle, ParentCategoryId = @ParentCategoryId
--        WHERE Id = @ID;

--        UPDATE PublishingHouses
--        SET [Name] = @PublishingHouseTitle
--        WHERE Id = @PublishingHouseId;

--        UPDATE Bindings
--        SET Title = @BindingTitle
--        WHERE Id = @BindingId;

--        UPDATE Books
--        SET Title = @BookTitle, Description = @BookDescription, ActualPrice = @BookActualPrice, DiscountPrice = @BookDiscountPrice,
--            PublishingHouseId = @PublishingHouseId, StockCount = @StockCount, ArtcileCode = @ArtcileCode, BindingId = @BindingId, Pages = @Page,
--            CategoryId = @CategoryId
--        WHERE Id = @ID;

--        UPDATE Authors
--        SET Name = @AuthorName, Surname = @AuthorSurname
--        WHERE Id = @BookAuthorAuthorID;

--        UPDATE Genres
--        SET Title = @GenreTitle
--        WHERE Id = @BookGenreGenreID;

--        UPDATE BooksGenres
--        SET BookId = @BookGenreBookID, GenreId = @BookGenreGenreID
--        WHERE Id = @ID;

--        UPDATE Languages
--        SET Title = @LanguageTitle
--        WHERE Id = @BookLanguageLangueageID;

--        UPDATE BooksLanguages
--        SET BookId = @BookLanguageBookID, LanguageID = @BookLanguageLangueageID
--        WHERE Id = @ID;

--        UPDATE Comments
--        SET Description = @CommentDescription, BookId = @CommentBookId, Rating = @CommentRating, Name = @CommentName, Email = @CommentEmail,
--            ImageUrl = @CommentImageUrl
--        WHERE Id = @ID;
--    END;
--END;


/* *** Task 2 *** */

--Create Trigger ChangeIsDeletedCategories
--on Categories
--Instead of delete 
--as
--begin 
--        UPDATE Categories
--        SET IsDeleted = 1
--end

--Create Trigger AuthorsIsDeletedCategories
--on Authors
--Instead of delete 
--as
--begin 
--        UPDATE Authors
--        SET IsDeleted = 1
--end

--Create Trigger PublishingHousesIsDeletedCategories
--on PublishingHouses
--Instead of delete 
--as
--begin 
--        UPDATE PublishingHouses
--        SET IsDeleted = 1
--end

--Create Trigger BindingsIsDeletedCategories
--on Bindings
--Instead of delete 
--as
--begin 
--        UPDATE Bindings
--        SET IsDeleted = 1
--end

--Create Trigger BooksIsDeletedCategories
--on Books
--Instead of delete 
--as
--begin 
--        UPDATE Books
--        SET IsDeleted = 1
--end

--Create Trigger GenresIsDeletedCategories
--on Genres
--Instead of delete 
--as
--begin 
--        UPDATE Genres
--        SET IsDeleted = 1
--end

--Create Trigger LanguagesIsDeletedCategories
--on Languages
--Instead of delete 
--as
--begin 
--        UPDATE Languages
--        SET IsDeleted = 1
--end