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
waste calls
"INBOUND-CRM-CM-AGENT"
"INBOUND-CRM-EMAIL-AGENT"
"INBOUND-CRM-INBOUND-AGENT"
"INBOUND-CRM-INBOUND-SUPERVISOR"
"INBOUND-CRM-L3-MOS"
"INBOUND-CRM-MOS-ASSISTANT-MANAGER"
"INBOUND-CRM-MOS-INBOUND-AGENT"
"INBOUND-CRM-MOS-OUTBOUND-AGENT"
"INBOUND-CRM-MOS-TEAM-LEAD"
"INBOUND-CRM-SUPERVISOR-TQ"

ecall
"INBOUND-CRM-ECALL-AGENT"
"INBOUND-CRM-ECALL-SUPERVISOR"
