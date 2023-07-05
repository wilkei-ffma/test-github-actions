USE [pacing_model_dash_dev]
GO
ALTER USER [awsffma\ffma-nonprod-rds-pacing-model-dash-dev] WITH DEFAULT_SCHEMA=NULL
GO
USE [pacing_model_dash_dev]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [awsffma\ffma-nonprod-rds-pacing-model-dash-dev]
GO
USE [pacing_model_dash_dev]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [awsffma\ffma-nonprod-rds-pacing-model-dash-dev]
GO
USE [pacing_model_dash_dev]
GO
ALTER ROLE [db_owner] ADD MEMBER [awsffma\ffma-nonprod-rds-pacing-model-dash-dev]
GO
