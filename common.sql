SELECT DISTINCT agm.code, agm.name
FROM auth_group_master agm
WHERE agm.id IN (
  SELECT auth_group_fkid 
  FROM auth_group_screen_roles 
  WHERE screen_role_fkid IN (
    SELECT screen_role_fkid 
    FROM screen_role_permission 
    WHERE screen_permission_fkid IN (
      SELECT id 
      FROM screen_permission_master 
      WHERE key ILIKE '%wast%call%'
    )
  )
);
