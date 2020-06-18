$CUSTrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global" -ResourceGroupName "eus-fecom-prod-infra"
$APITrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global-api" -ResourceGroupName "eus-fecom-prod-infra"
$ADMTrafficManagerProfile = Get-AzureRmTrafficManagerProfile -Name "eus-fecom-prod-tm-global-adm" -ResourceGroupName "eus-fecom-prod-infra"


$CUSTrafficManagerProfile.TrafficRoutingMethod = "Weighted"
$APITrafficManagerProfile.TrafficRoutingMethod = "Weighted"
$ADMTrafficManagerProfile.TrafficRoutingMethod = "Weighted"


Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $CUSTrafficManagerProfile
Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $APITrafficManagerProfile
Set-AzureRmTrafficManagerProfile -TrafficManagerProfile $ADMTrafficManagerProfile

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global
$profile.Endpoints

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global-api
$profile.Endpoints

$Profile = Get-AzureRmTrafficManagerProfile -ResourceGroupName eus-fecom-prod-infra -Name eus-fecom-prod-tm-global-adm
$profile.Endpoints