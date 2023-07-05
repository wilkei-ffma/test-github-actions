select distinct r.id                                       as "Repository ID",
                r.name                                     as "Repository Name",
                --cu.id                                      as "User ID (Individual)",
                cu.user_name                               as "Username (Individual)",
                Concat(cu.first_name, ' ', cu.last_name)   as "Fullname (Individual)",
                rp.group_name                              as "Group Access",
                --cu1.id                                     as "User ID (Group)",
                cu1.user_name                              as "Username (Group)",
                Concat(cu1.first_name, ' ', cu1.last_name) as "Fullname (Group)",
               --cd.directory_name                          as "Directory (Individual)",
               -- cd.directory_type                          as "Directory Type (Individual)",
              -- cd1.directory_name                         as "Directory (Group)",
               cd1.directory_type                         as "Directory Type (Group)"
from repository r
         left join sta_repo_permission rp
                   on rp.repo_id = r.id
        left join sta_normal_user u
                   on rp.user_id = u.user_id
         left join cwd_user cu
                   on cu.lower_user_name = u.name
         left join cwd_membership cm
                   on cm.lower_parent_name = rp.group_name
         left join cwd_user cu1
                   on cu1.lower_user_name = cm.lower_child_name
        left join cwd_directory cd
                   on cd.id = cu.directory_id
         left join cwd_directory cd1
                   on cd1.id = cu1.directory_id
where rp.group_name is not null
   or rp.user_id is not null
ORDER BY r.id;