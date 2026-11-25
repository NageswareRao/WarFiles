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


'common:ib:module:email','common:ib:menu:email:inbox','common:ib:menu:email:sent','common:ib:menu:email:junk','common:ib:menu:inbox','common:ib:menu:sent','common:ib:menu:junk','common:ib:menu:email-care','common:ib:menu:agent-availability','common:ib:menu:performance-tracking','common:ib:menu:configuration:sla-config','common:ib:email:sla-config:sla-log','common:ib:email:template','common:ib:email:email-interaction','common:ib:contacts:360contact:email-interaction','common:ib:menu:contacts','common:ib:menu:cases','common:ib:cases:add-edit'


common:ib:module:email
common:ib:menu:email:inbox
common:ib:menu:email:sent
common:ib:menu:email:junk
common:ib:menu:inbox
common:ib:menu:sent
common:ib:menu:junk
common:ib:menu:email-care
common:ib:menu:agent-availability
common:ib:menu:performance-tracking
common:ib:menu:configuration:sla-config
common:ib:email:sla-config:sla-log
common:ib:email:template
common:ib:email:email-interaction
common:ib:contacts:360contact:email-interaction
common:ib:menu:contacts
common:ib:menu:cases
common:ib:cases:add-edit

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
