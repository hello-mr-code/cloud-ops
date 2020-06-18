Set-AzContext -Subscription AZ-FUTEK-ECOM-PROD
Restart-AzWebApp -ResourceGroupName "eus2-fecom-prod-infra" -Name "eus2-fecom-prod-web-api"