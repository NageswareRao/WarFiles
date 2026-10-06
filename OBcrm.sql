jr_864cfaa95a8fddae42a24a25e8ee75ca1f13d73d37a409115c0d4a39279004fe

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
