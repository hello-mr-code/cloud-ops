$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-agw-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint

$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus-fecom-prod-agw-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 2
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint



$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-api-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-api" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint

$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus-fecom-prod-api-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-api" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 2
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint



$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus2-fecom-prod-adm-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-adm" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 1
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint

$TrafficManagerEndpoint = Get-AzureRmTrafficManagerEndpoint -Name "eus-fecom-prod-adm-endpoint" -Type AzureEndpoints -ProfileName "eus-fecom-prod-tm-global-adm" -ResourceGroupName "eus-fecom-prod-infra"
$TrafficManagerEndpoint.Priority = 2
Set-AzureRmTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint


$CUSTrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global" -ResourceGroupName "eus-fecom-prod-infra"
$APITrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global-api" -ResourceGroupName "eus-fecom-prod-infra"
$ADMTrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global-adm" -ResourceGroupName "eus-fecom-prod-infra"


$CUSTrafficManagerProfile.TrafficRoutingMethod = "Priority"
$APITrafficManagerProfile.TrafficRoutingMethod = "Priority"
$ADMTrafficManagerProfile.TrafficRoutingMethod = "Priority"


Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $CUSTrafficManagerProfile
Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $APITrafficManagerProfile
Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $ADMTrafficManagerProfile

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global
$profile.Endpoints

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global-api
$profile.Endpoints

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global-adm
$profile.Endpoints