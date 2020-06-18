#! /usr/bin/env pwsh

## Input Parameters
$resourceGroupName="eus-fecom-prod-stg"
$storageAccName="eusfecomprodstgdiag"
$StartTime = Get-Date
$EndTime = $startTime.AddHours(1.0)

## Connect to Azure Account
#Connect-AzAccount

## Function to get all the blobs
Function CreateSASToken
{
    Write-Host -ForegroundColor Green "Creating an account level SAS Token.."
    ## Get the storage account
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName
    ## Get the storage account context
    $ctx=$storageAcc.Context
    ## Creates an account-level SAS token.
    New-AzStorageAccountSASToken -Context $ctx -Service Blob -ResourceType Service,Container,Object -Permission "racwdlup" -StartTime $StartTime -ExpiryTime $EndTime
}

CreateSASToken

## Disconnect from Azure Account
#Disconnect-AzAccount

## Input Parameters
$resourceGroupName="eus2-fecom-prod-stg"
$storageAccName="eus2fecomprodstgdiag"

## Connect to Azure Account
#Connect-AzAccount

## Function to get all the blobs
Function CreateSASToken
{
    Write-Host -ForegroundColor Green "Creating an account level SAS Token.."
    ## Get the storage account
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName
    ## Get the storage account context
    $ctx=$storageAcc.Context
    ## Creates an account-level SAS token.
    New-AzStorageAccountSASToken -Context $ctx -Service Blob -ResourceType Service,Container,Object -Permission "racwdlup" -StartTime $StartTime -ExpiryTime $EndTime
}

CreateSASToken

## Disconnect from Azure Account
#Disconnect-AzAccount
