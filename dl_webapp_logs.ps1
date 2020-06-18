v_subscriptionid=A83372FB-83CB-46B7-B277-50659AB55216
v_resource=APPLICATIONGATEWAYS
v_stgaccnt_suffix=fecomprodstgdiag
v_resgrp_suffix=FECOM-PROD-SEC
v_resname_suffix=FECOM-PROD-AGW-V2
v_year=2020
v_mon=05

./genSASkey.ps1 > .StorageKeys.diag

for v_day in {22..26}
#for v_day in 14
do
        for v_region in eus eus2
        do
#               if [ $v_resource == APPLICATIONGATEWAYS ]
#               then
#                       v_providers=MICROSOFT.NETWORK

#                        for v_logmetric in webserver-logs application-logs
                         for v_logmetric in webserver-logs
			 do
                                if [ $v_region == eus ]
                                then
                                        v_sas_key=`grep racupwdl .StorageKeys.diag | head -1`
                                else
                                        v_sas_key=`grep racupwdl .StorageKeys.diag | tail -1`
                                fi

                                v_region_upper=`echo $v_region | tr '[:lower:]' '[:upper:]'`
                                v_local_path="C:\Futek\LogAnalytics\\${v_logmetric}\\${v_region}"
																
                                for v_portal in CUS API ADM
                                do
										v_res_name="${v_region_upper}-FECOM-PROD-WEB-${v_portal}"
										
										if [ $v_logmetric == application-logs ]
										then
											v_resource_name=`echo $v_res_name | tr '[:upper:]' '[:lower:]'`
										else
											v_resource_name=$v_res_name
										fi
										
                                        v_blobURI="https://${v_region}${v_stgaccnt_suffix}.blob.core.windows.net/$v_logmetric/$v_resource_name"
                                        azcopy copy "${v_blobURI}/${v_year}/${v_mon}/${v_day}${v_sas_key}" "${v_local_path}\\${v_portal}" --recursive=true
                                done
                        done
#               fi
        done
done
