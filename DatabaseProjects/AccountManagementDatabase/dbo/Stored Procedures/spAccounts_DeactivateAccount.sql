CREATE PROCEDURE [dbo].[spAccounts_DisableAccount]
	@AccountID int,
	@Status varchar(50),
	@StatusReason varchar(max)
AS
	IF Exists(Select * From Accounts_Core Where AccountID = @AccountID)
	BEGIN
		Update Accounts_Core
		Set IsActive = 0,
		Status = @Status,
		StatusMessage = @StatusReason
		Where AccountID = @AccountID
	END
	Else
	BEGIN
		RaisError('Invalid Account', 16, 1)
	END
RETURN 0
