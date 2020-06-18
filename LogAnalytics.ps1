v_subscriptionid=A83372FB-83CB-46B7-B277-50659AB55216
v_resource=APPLICATIONGATEWAYS
v_stgaccnt_suffix=fecomprodstgdiag
v_resgrp_suffix=FECOM-PROD-SEC
v_resname_suffix=FECOM-PROD-AGW-V2
v_year=2020
v_mon=05

#for v_day in {12..18}
for v_day in 13
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
						
						v_local_path="C:\Futek\reports\dump\\${v_logmetric}\\${v_region}"
						
						v_blobURI="https://${v_region}${v_stgaccnt_suffix}.blob.core.windows.net/$v_logmetric/resourceId=/SUBSCRIPTIONS/$v_subscriptionid/RESOURCEGROUPS/${v_region_upper}-${v_resgrp_suffix}/PROVIDERS/$v_providers/$v_resource/${v_region_upper}-${v_resname_suffix}"
						
						azcopy copy "${v_blobURI}/y=${v_year}/m=${v_mon}/d=${v_day}${v_sas_key}" "${v_local_path}" --recursive=true
			
						cd $v_local_path
						
						for file in `find . -name '*.*' | grep json`
						do
								dof=`echo $file | awk -F'/' '{print $2}' | awk -F'=' '{print "d"$NF}'`
								hof=`echo $file | awk -F'/' '{print $3}' | awk -F'=' '{print "h"$NF}'`
								cp $file ${v_region}_${dof}_${hof}.log
						done

						for file in `ls -tlr *.log | awk '{print $NF}'`
						do
							cat $file >> all.files
						done
						
						mkdir -p all_files
						mv *.log all_files
						split -d -l1 all.files

						cd -
					done
			fi
	done
done
