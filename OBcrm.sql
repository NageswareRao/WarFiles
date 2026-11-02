('ST-000000099864598','ST-000000099875938','ST-000000099875413','ST-000000099877782','ST-000000099866002','ST-000000099877490','ST-000000099869499','ST-000000099871818','ST-000000099871270','ST-000000099866537','ST-000000099867834','ST-000000099869488','ST-000000099876398','ST-000000099870575','ST-000000099877909','ST-000000099879645','ST-000000099866391','ST-000000099868008')
-- Check if records are outside 2-day window
SELECT 
    survey_taker_crmid,
    campaign_crm_id,
    current_state,
    created_datetime,
    modified_date,
    NOW() as current_time,
    NOW() - INTERVAL '2 days' as two_days_ago,
    CASE 
        WHEN created_datetime < NOW() - INTERVAL '2 days' AND modified_date < NOW() - INTERVAL '2 days' 
            THEN 'BLOCKED: Outside 2-day window'
        ELSE 'ELIGIBLE FOR SYNC'
    END as sync_status
FROM msil_dps.crm_dps_master_data
WHERE survey_taker_crmid IN ('ST-000000099864598','ST-000000099875938','ST-000000099875413','ST-000000099877782','ST-000000099866002','ST-000000099877490','ST-000000099869499','ST-000000099871818','ST-000000099871270','ST-000000099866537','ST-000000099867834','ST-000000099869488','ST-000000099876398','ST-000000099870575','ST-000000099877909','ST-000000099879645','ST-000000099866391','ST-000000099868008');
-- Check if campaign exists and has records
SELECT 
    campaign_crm_id,
    COUNT(*) as total_records,
    COUNT(CASE WHEN current_state IS NULL THEN 1 END) as pending_records,
    MIN(created_datetime) as oldest_created,
    MAX(modified_date) as latest_modified
FROM msil_dps.crm_dps_master_data
WHERE campaign_crm_id = 'CMP-0000000001'
GROUP BY campaign_crm_id;

-- Check if any records from this campaign are already synced (current_state = COMPLETED)
SELECT 
    campaign_crm_id,
    current_state,
    COUNT(*) as count
FROM msil_dps.crm_dps_master_data
WHERE campaign_crm_id = 'CMP-0000000001'
GROUP BY campaign_crm_id, current_state;

-- Check if sync job ran recently
SELECT 
    job_name,
    job_start_time,
    job_end_time,
    sync_status,
    created_count,
    total_count
FROM msil_dps.sync_job_log
WHERE table_name = 'msil_dps.crm_dps_master_data'
  AND job_start_time >= NOW() - INTERVAL '3 days'
ORDER BY job_start_time DESC;


SELECT sjl.*
FROM msil_dps.sync_job_log sjl
WHERE job_name = 'job_postgreSQL_to_campaign_wise_automailer_csv'
  AND EXTRACT(
        EPOCH FROM (
            (NOW() + INTERVAL '5 hours 30 minutes') - job_start_time
        )
      ) < 86400
ORDER BY job_start_time DESC
LIMIT 1;

SELECT sjl.*
FROM msil_dps.sync_job_log sjl
WHERE job_name = 'job_postgreSQL_to_campaign_wise_automailer_csv'
  AND job_start_time >= '2026-09-03 00:00:00'
  AND job_start_time <  '2026-09-04 00:00:00'
ORDER BY job_start_time DESC;

SELECT batch_id, job_name, job_start_time, job_end_time, sync_status, created_count, total_count
FROM msil_dps.sync_job_log 
WHERE job_name = 'job_postgreSQL_to_campaign_wise_automailer_csv'
  AND job_start_time >= '2026-10-04 07:00:00'
ORDER BY job_start_time DESC;
