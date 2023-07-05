USE [bipsync_data_uat]
GO
CREATE USER [FFMA\svc_ProdPBI] FOR LOGIN [FFMA\svc_ProdPBI]
GO
USE [bipsync_data_uat]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FFMA\svc_ProdPBI]
GO
