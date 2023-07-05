SELECT a.user_name, dateadd(s, convert(bigint, b.attribute_value) / 1000, convert(datetime, '1-1-1970 00:00:00'))
FROM cwd_user a, cwd_user_attribute b
WHERE a.id = b.user_id and b.attribute_name = 'lastAuthenticationTimestamp'