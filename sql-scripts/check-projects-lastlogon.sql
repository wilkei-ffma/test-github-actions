select p.pkey,p.pname,pcounter AS number_of_stories,p.LEAD from project p ORDER BY pcounter ASC;


SELECT DISTINCT p.pkey,p.pname,p.LEAD,MAX(i.UPDATED) as "Last Updated"
FROM jiraissue i
INNER JOIN project p
ON p.ID = i.PROJECT
GROUP BY p.pkey,p.LEAD,p.pname
ORDER BY MAX(i.UPDATED) ASC