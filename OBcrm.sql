('ST-000000099864598','ST-000000099875938','ST-000000099875413','ST-000000099877782','ST-000000099866002','ST-000000099877490','ST-000000099869499','ST-000000099871818','ST-000000099871270','ST-000000099866537','ST-000000099867834','ST-000000099869488','ST-000000099876398','ST-000000099870575','ST-000000099877909','ST-000000099879645','ST-000000099866391','ST-000000099868008')
SELECT *
FROM crm_dps_master_data d
WHERE d.campaign_crm_id = 'CMP-0000000001'
  AND (
        d.created_datetime >= CURRENT_DATE - INTERVAL '2 days'
        OR d.modified_date >= CURRENT_DATE - INTERVAL '2 days'
      )
  AND (
        d.current_state != 'COMPLETED'
        OR d.current_state IS NULL
      );

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
