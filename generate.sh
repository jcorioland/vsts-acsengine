#!/bin/bash

echo ${ACS_SSH_PUBLIC}

acs-engine generate \
    --api-model ${ACS_API_MODEL} \
    --set masterProfile.dnsPrefix="jcodev" \
    --set servicePrincipalProfile.clientID=${SERVICE_PRINCIPAL_CLIENT_ID} \
    --set servicePrincipalProfile.secret=${SERVICE_PRINCIPAL_SECRET} \
    --set linuxProfile.adminUsername="jcorioland" \
    --set linuxProfile.ssh.publicKeys[0].keyData="${ACS_SSH_PUBLIC}" \
    --output-directory ${ACS_CLUSTER_ENV}

ls -l ${ACS_CLUSTER_ENV} 

cat ${ACS_CLUSTER_ENV}/apimodel.json