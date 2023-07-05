--exec msdb.dbo.rds_restore_database
--@restore_db_name='IDM_Prod_Clone',
--@s3_arn_to_restore_from='arn:aws:s3:::ffma-eng-rds-backups/backups/idm/idm_7.bak'
--s3://ffma-eng-rds-backups/backups/idm/idm_4.bak

exec msdb.dbo.rds_task_status

--exec msdb.dbo.rds_restore_database
--@restore_db_name='IDM_Prod_Copy1',
--@s3_arn_to_restore_from='arn:aws:s3:::ffma-nonprod-rds/backups/idm-prod/IDM_7.bak'
--s3://ffma-nonprod-rds/backups/idm-prod/IDM_7.bak

exec msdb.dbo.rds_task_status


--exec msdb.dbo.rds_restore_database
	--@restore_db_name='database_name',
	--@s3_arn_to_restore_from='arn:aws:s3:::bucket_name/file_name.extension',
	--@with_norecovery=0|1,
	--[@kms_master_key_arn='arn:aws:kms:region:account-id:key/key-id'],
	--[@type='DIFFERENTIAL|FULL'];
	
	--exec msdb.dbo.rds_backup_database
	--@source_db_name='jira_prod',
	--@s3_arn_to_backup_to='arn:aws:s3:::ffma-eng-rds-backups/backups',
	--[@kms_master_key_arn='arn:aws:kms:region:account-id:key/key-id'],	
	--[@overwrite_s3_backup_file=0|1],
	--[@type='DIFFERENTIAL|FULL'],
	--[@number_of_files=n];