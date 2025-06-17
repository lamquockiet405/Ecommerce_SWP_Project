CREATE PROCEDURE [dbo].[insertProduct] 
    @ProductName NVARCHAR(100), 
    @Description NVARCHAR(MAX), 
    @Status INT,
    @CategoryID INT,
    @ShopID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewProductID TABLE (ProductID INT);

    INSERT INTO [Products] ([ProductName], [Description], [Status], [CategoryID], [ShopId])
    OUTPUT INSERTED.[ProductID] INTO @NewProductID
    VALUES (@ProductName, @Description, @Status, @CategoryID, @ShopID);
    
    SELECT ProductID FROM @NewProductID;
END;
