SELECT DISTINCT key 
FROM screen_permission_master 
WHERE id IN (
  SELECT screen_permission_fkid 
  FROM screen_role_permission 
  WHERE screen_role_fkid IN (
    SELECT screen_role_fkid 
    FROM auth_group_screen_roles 
    WHERE auth_group_fkid IN (
      SELECT id 
      FROM auth_group_master 
      WHERE code IN ('GROUP1', 'GROUP2', 'GROUP3')
    )
  )
);
