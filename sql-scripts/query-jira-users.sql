select distinct a.user_key, u.lower_user_name, u.display_name, sd.LICENSE_ROLE_NAME as SD, sw.LICENSE_ROLE_NAME as SW, DATEADD(MINUTE, CAST(ua.attribute_value AS bigint)/60000, '01/01/1970') as LastLogin
from cwd_user u
join cwd_membership m on u.lower_user_name = m.lower_child_name
join cwd_group g on g.id = m.parent_id
join licenserolesgroup lic on lic.GROUP_ID = g.lower_group_name and lic.LICENSE_ROLE_NAME in ( 'jira-software')
left join licenserolesgroup sd on sd.GROUP_ID = g.lower_group_name and sd.LICENSE_ROLE_NAME = 'jira-servicedesk'
left join licenserolesgroup sw on sw.GROUP_ID = g.lower_group_name and sw.LICENSE_ROLE_NAME = 'jira-software'
left join cwd_user_attributes ua on u.id = ua.user_id and ua.attribute_name = 'login.lastLoginMillis'
join app_user a on u.lower_user_name = a.lower_user_name
join cwd_directory dir on dir.id = u.directory_id
where u.active = 1
and dir.active = 1
and dir.id = 10000
and ua.attribute_value is not null
and (DATEADD(MINUTE, CAST(ua.attribute_value AS bigint)/60000, '01/01/1970') < '2021-07-01 00:00:00')
order by LastLogin desc