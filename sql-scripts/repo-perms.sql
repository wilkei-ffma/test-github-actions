SELECT r.id, p.project_key, r.project_id, r.slug, r.name, rp.perm_id, rp.group_name, u.name, rp.user_id 
FROM repository r LEFT JOIN sta_repo_permission rp ON rp.repo_id = r.id 
LEFT JOIN sta_normal_user u on (rp.user_id = u.user_id) 
LEFT JOIN project p on r.project_id = p.id 
ORDER BY r.id;