SELECT * FROM case_management.login_history WHERE cognito_id = 'cop-crm-ad_81113664@maruticrm.onmicrosoft.com' ORDER BY login_time DESC

db.mos_cases.countDocuments({
  'vehicleInfo.vehicleRegNo': {$regex: "KA53MQ4085", $options: 'i'}
})

db.mos_cases.find({
  'vehicleInfo.vehicleRegNo': 'KA53MQ4085'
})


db.mos_cases.find(
  {
    'crmCaseStatus': {
      $in: [
        'Pending for Allocation',
        'Pending for Out for Service',
        'Out for Service',
        'Reached',
        'Technician Cancelled',
        'Towing Required',
        'Towing is Required',
        'Closed',
        'Resolved',
        'Customer Cancelled',
        "Can't Rectify",
        'Resolved on call',
        'Towing Cancelled'
      ]
    },
    'vehicleInfo.vehicleRegNo': {
      $regex: 'KA53MQ4085',
      $options: 'i'
    }
  }
).sort({ 'createdAtDB': -1 })
