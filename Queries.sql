SELECT * FROM case_management.login_history WHERE cognito_id = 'cop-crm-ad_81113664@maruticrm.onmicrosoft.com' ORDER BY login_time DESC

db.mos_cases.countDocuments({
  'vehicleInfo.vehicleRegNo': {$regex: "KA53MQ4085", $options: 'i'}
})
