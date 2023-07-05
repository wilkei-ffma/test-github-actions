--
-- List all users in each database and their role assignments
--
SELECT DB_NAME(), RP.type_desc AS [RoleType], RP.name, UP.name, UP.type_desc [UserType], UP.default_schema_name AS [User_Schema]
FROM sys.database_role_members AS R
INNER JOIN sys.database_principals AS UP
    ON UP.principal_id = R.member_principal_id
INNER JOIN sys.database_principals AS RP
    ON RP.principal_id = R.role_principal_id
ORDER BY RP.name, UP.name
GO
--
-- List all users in each database and their role assignments
--
EXEC sp_msforeachdb 'USE [?];
    SELECT DB_NAME(), RP.type_desc AS [RoleType], RP.name, UP.name, UP.type_desc [UserType], UP.default_schema_name AS [User_Schema]
    FROM sys.database_role_members AS R
    INNER JOIN sys.database_principals AS UP
        ON UP.principal_id = R.member_principal_id
    INNER JOIN sys.database_principals AS RP
        ON RP.principal_id = R.role_principal_id
    ORDER BY RP.name, UP.name
'
GO