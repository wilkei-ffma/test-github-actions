SELECT SP.principal_id
	,SP.name
	,SUSER_NAME(role_principal_id) server_role
	,SP.is_disabled
	,SP.type_desc
	,SP.sid
	,SP.type
	,SP.create_date
	,SP.modify_date
	,SP.default_database_name
	,SP.default_language_name
	,SP.credential_id
	,SP.owning_principal_id
	,SP.is_fixed_role
FROM sys.server_principals AS SP
LEFT JOIN sys.server_role_members AS RM ON SP.principal_id = RM.member_principal_id;
 