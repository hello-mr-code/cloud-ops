v_subscriptionid=A83372FB-83CB-46B7-B277-50659AB55216
v_resource=APPLICATIONGATEWAYS
v_stgaccnt_suffix=fecomprodstgdiag
v_resgrp_suffix=FECOM-PROD-SEC
v_resname_suffix=FECOM-PROD-AGW-V2
v_year=2020
v_mon=05

./genSASkey.ps1 > .StorageKeys.diag

#for v_day in {22..26}
for v_day in 31
do
	for v_region in eus eus2
	do
		if [ $v_resource == APPLICATIONGATEWAYS ]
		then
			v_providers=MICROSOFT.NETWORK

			for v_logmetric in insights-logs-applicationgatewayaccesslog insights-logs-applicationgatewayfirewalllog
			do
				if [ $v_region == eus ]
				then
						v_sas_key=`grep racupwdl .StorageKeys.diag | head -1`
				else
						v_sas_key=`grep racupwdl .StorageKeys.diag | tail -1`
				fi

				v_region_upper=`echo $v_region | tr '[:lower:]' '[:upper:]'`

				v_local_path="C:\Futek\LogAnalytics\\${v_logmetric}\\${v_region}"

				v_blobURI="https://${v_region}${v_stgaccnt_suffix}.blob.core.windows.net/$v_logmetric/resourceId=/SUBSCRIPTIONS/$v_subscriptionid/RESOURCEGROUPS/${v_region_upper}-${v_resgrp_suffix}/PROVIDERS/$v_providers/$v_resource/${v_region_upper}-${v_resname_suffix}"

				azcopy copy "${v_blobURI}/y=${v_year}/m=${v_mon}/d=${v_day}${v_sas_key}" "${v_local_path}" --recursive=true
			done
		fi
	done
done
