CREATE PROCEDURE [dbo].[spAccounts_EnableAccount]
	@AccountID int
AS
	IF Exists(Select * From Accounts_Core Where AccountID = @AccountID)
	BEGIN
		Update Accounts_Core
		Set IsActive = 1,
		Status = Null,
		StatusMessage = Null
		Where AccountID = @AccountID
	END
	Else
	BEGIN
		RaisError('Invalid Account', 16, 1)
	END
RETURN 0
