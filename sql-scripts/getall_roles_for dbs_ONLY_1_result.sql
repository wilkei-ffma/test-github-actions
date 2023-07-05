IF OBJECT_ID(N'tempdb..#Results') IS NOT NULL DROP TABLE #Results
CREATE TABLE #Results
(
DatabaseName NVARCHAR(100),
RoleType NVARCHAR(100),
RoleName NVARCHAR(200),
UserLogin NVARCHAR(200),
UserType NVARCHAR(200),
UserSchema NVARCHAR(100)
)


DECLARE @DB_Name varchar(100)
DECLARE @Command nvarchar(2000)
DECLARE database_cursor CURSOR FOR
SELECT name
FROM MASTER.sys.sysdatabases



OPEN database_cursor



FETCH NEXT FROM database_cursor INTO @DB_Name



WHILE @@FETCH_STATUS = 0
BEGIN
IF @DB_Name NOT IN ('model', 'PearlData','_dbaid','DBAdmin','FFMA_DSU', 'ffma_idm_servicenow_poc','BipSync_Test','IDM_DC_TEST', 'BipSync_Dev', 'IDM_DC_UAT', 'IDM_DMP_REC_DEV', 'IDM_DMP_REC_UAT',  'IDM_DMP_REC_TEST', 'IDMTest','tempdb')
BEGIN
SELECT @Command = 'USE ' + @DB_Name +'; INSERT INTO #Results SELECT ' + '''' + @DB_Name + '''' + ', RP.type_desc AS [RoleType], RP.name, UP.name, UP.type_desc [UserType], UP.default_schema_name AS [User_Schema] FROM sys.database_role_members AS R INNER JOIN sys.database_principals AS UP ON UP.principal_id = R.member_principal_id INNER JOIN sys.database_principals AS RP ON RP.principal_id = R.role_principal_id ORDER BY RP.name, UP.name'
EXEC sp_executesql @Command
END



FETCH NEXT FROM database_cursor INTO @DB_Name
END

CLOSE database_cursor
DEALLOCATE database_cursor
SELECT * FROM #Results
IF OBJECT_ID(N'tempdb..#Results') IS NOT NULL DROP TABLE #Results