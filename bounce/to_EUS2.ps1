$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-agw-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint


$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-api-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-api" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint


$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-adm-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-adm" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint
