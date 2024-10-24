
USE Organic
GO

--DROP TABLE Invoice
--DROP TABLE InvoiceDetail
--DROP PROC AddInvoice

CREATE TABLE Invoice(
	InvoiceId CHAR(32) NOT NULL PRIMARY KEY,
	CartCode CHAR(32) NOT NULL,
	InvoiceDate DATETIME NOT NULL DEFAULT GETDATE(),
	FirstName NVARCHAR(32) NOT NULL,
	LastName NVARCHAR(32) NOT NULL,
	Address NVARCHAR(128) NOT NULL,
	State NVARCHAR(32) NOT NULL,
	City NVARCHAR(32) NOT NULL,
	Country NVARCHAR(32) NOT NULL,
	Note NVARCHAR(128) NOT NULL,
	PostCode CHAR(32) NOT NULL,
	Email VARCHAR(32) NOT NULL,
	Phone VARCHAR(32) NOT NULL
)
GO

CREATE TABLE InvoiceDetail(
	InvoiceId CHAR(32) NOT NULL,
	ProductId INT NOT NULL,
	Quantity SMALLINT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL
)
GO

CREATE PROC AddInvoice(
	@CartCode VARCHAR(32),
	@InvoiceId CHAR(32),
	@InvoiceDate DATETIME,
	@FirstName NVARCHAR(32),
	@LastName NVARCHAR(32),
	@Address NVARCHAR(128),
	@State NVARCHAR(32),
	@City NVARCHAR(32),
	@Country NVARCHAR(32),
	@Note NVARCHAR(128),
	@PostCode CHAR(32),
	@Email VARCHAR(32),
	@Phone VARCHAR(32)
)
AS
BEGIN
	INSERT INTO Invoice(InvoiceId, CartCode, InvoiceDate, FirstName, LastName, Address, State, City, Country, Note, PostCode, Email, Phone) VALUES
		(@InvoiceId, @CartCode, @InvoiceDate, @FirstName, @LastName, @Address, @State, @City, @Country, @Note, @PostCode, @Email, @Phone);
	INSERT INTO InvoiceDetail(InvoiceId, ProductId, Quantity, Price)
		SELECT @InvoiceId, Cart.ProductId, Cart.Quantity, Product.Price
		FROM Cart JOIN Product ON Cart.CartCode = @CartCode AND Product.ProductId = Cart.ProductId;
	DELETE FROM Cart WHERE CartCode = @CartCode;
END

SELECT * FROM Invoice
SELECT * FROM InvoiceDetail
SELECT * FROM Cart

CREATE PROC GetInvoiceAmount(@Id CHAR(32))
AS
	SELECT SUM(Quantity*Price) AS Amount FROM InvoiceDetail WHERE InvoiceId = @Id;
GO

CREATE TABLE VnPay(
	Amount BIGINT NOT NULL,
	BankCode VARCHAR(32) NOT NULL,
	BankTranNo VARCHAR(32) NOT NULL,
	CardType VARCHAR(32) NOT NULL,
	OrderInfo VARCHAR(128) NOT NULL,
	PayDate VARCHAR(32) NOT NULL,
	ResponseCode VARCHAR(32) NOT NULL,
	TmnCode VARCHAR(32) NOT NULL,
	TransactionNo VARCHAR(32) NOT NULL,
	TransactionStatus VARCHAR(32) NOT NULL,
	TxnRef VARCHAR(32) NOT NULL,
	SecureHash VARCHAR(1024) NOT NULL,
)

CREATE PROC AddVnPay
(	
	@Amount BIGINT,
	@BankCode VARCHAR(32),
	@BankTranNo VARCHAR(32),
	@CardType VARCHAR(32),
	@OrderInfo VARCHAR(32),
	@PayDate VARCHAR(32),
	@ResponseCode VARCHAR(32),
	@TmnCode VARCHAR(32),
	@TransactionNo VARCHAR(32),
	@TransactionStatus VARCHAR(32),
	@TxnRef VARCHAR(32),
	@SecureHash VARCHAR(1024)
)
AS
INSERT INTO VnPay VALUES
	(@Amount, @BankCode, @BankTranNo, @CardType, @OrderInfo, @PayDate, @ResponseCode, @TmnCode, @TransactionNo, @TransactionStatus, @TxnRef, @SecureHash);
GO

SELECT * FROM VnPay