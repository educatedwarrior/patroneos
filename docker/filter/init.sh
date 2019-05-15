#!/bin/sh

#if [ -f "${DATADIR}/${CONFIGFILE}" ]
#  then
#    echo
#  else
#    cp /${CONFIGFILE} ${DATADIR}
#    sed -i "/rpcuser/c\rpcuser=${RPCUSER}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/rpcpassword/c\rpcpassword=${RPCPWD}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/rpcport/c\rpcport=${RPCPORT}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/port=externalport/c\port=${PUBLICPORT}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/externalip/c\externalip=${PUBLICIP}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/bind/c\#bind=${PUBLICIP}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/masternodeaddr/c\masternodeaddr=${PUBLICIP}:${PUBLICPORT}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/masternodeprivkey/c\masternodeprivkey=${MNPRIVKEY}" "${DATADIR}/${CONFIGFILE}"
#    sed -i "/masternode=/c\masternode=${MNACTIVATE}" "${DATADIR}/${CONFIGFILE}"
#fi

cp ${DATADIR}/config.json.sample ${DATADIR}/${CONFIGFILE}

sed -i -e "s/localhost:8081/${FILTER_ENDPOINT}/g" ${DATADIR}/${CONFIGFILE}
sed -i -e "s/localhost:8080/${LOG_ENDPOINT}/g" ${DATADIR}/${CONFIGFILE}
sed -i -e "s/localhost/${NODEOS_URL}/g" ${DATADIR}/${CONFIGFILE}



#echo $PATRONEOS_CONFIG > "${DATADIR}/${CONFIGFILE}"

exec ${DAEMONFILE}

