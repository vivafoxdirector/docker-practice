#!/bin/bash

# MySQL START
`service mysql restart`

# CREATE OUTPUT DIR
if [ ! -d "output" ]
then
    `mkdir output`
fi

# Path
## [CHG] MYSQL_PATH="/usr/local/mysql/bin"
MYSQL_PATH="/usr/bin"

# Edu DB Info
USER_ID="oc_admin"
USER_PWD="Ebsoncls#1"
DB_PORT=3306

# [NEW] MASTER Server List
# AUTH="db-5kvss.vpc-cdb.ntruss.com"
GW="db-5l34s.vpc-cdb.ntruss.com"
GG1="db-5kv7f.vpc-cdb.ntruss.com"
GG2="db-5kv87.vpc-cdb.ntruss.com"
GG3="db-5kvf3.vpc-cdb.ntruss.com"
GG4="db-5sn3v.vpc-cdb.ntruss.com"
GG5="db-5kvr6.vpc-cdb.ntruss.com"
GN="db-5l359.vpc-cdb.ntruss.com"
GB="db-5l375.vpc-cdb.ntruss.com"
# COM="db-5l33j.vpc-cdb.ntruss.com"
GJ="db-5l385.vpc-cdb.ntruss.com"
DG="db-5l38n.vpc-cdb.ntruss.com"
DJ="db-5l39h.vpc-cdb.ntruss.com"
BS="db-5l3ag.vpc-cdb.ntruss.com"
SU1="db-5kuhh.vpc-cdb.ntruss.com"
SU2="db-5kuu3.vpc-cdb.ntruss.com"
SU3="db-5kv33.vpc-cdb.ntruss.com"
SJ="db-5l3av.vpc-cdb.ntruss.com"
US="db-5l3bd.vpc-cdb.ntruss.com"
IC1="db-5kvrq.vpc-cdb.ntruss.com"
IC2="db-5kvs9.vpc-cdb.ntruss.com"
JN="db-5l3dk.vpc-cdb.ntruss.com"
JB="db-5l3e4.vpc-cdb.ntruss.com"
JJ="db-5l3eq.vpc-cdb.ntruss.com"
CN="db-5l3fd.vpc-cdb.ntruss.com"
CB="db-5l3fs.vpc-cdb.ntruss.com"
# STAT="db-5l341.vpc-cdb.ntruss.com"

OFEC_ARR=("GW" "GG1" "GG2" "GG3" "GG4" "GG5" "GN" "GB" "GJ" "DG" "DJ" "BS" "SU1" "SU2" "SU3" "SJ" "US" "IC1" "IC2" "JN" "JB" "JJ" "CN" "CB")

# Day Setting
FROM_DT=`date -d "-1 month" '+%Y-%m-%d'`
TO_DT=`date '+%Y-%m-%d'`
FROM_DT="2021-03-01"
TO_DT="2021-09-01"

# School List
SCHQRY="SELECT TABLE_SCHEMA FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LCT_CLASS_ALL_VCLS_PRTCN_HIST'"

# Server Loop
for OFEC_CD in ${OFEC_ARR[@]}
do
    echo "${OFEC_CD}"
    DB_SVR=`eval echo '$'${OFEC_CD}`
    SCHLST=`${MYSQL_PATH}/mysql -N -A --user=${USER_ID} --password=${USER_PWD} --port=${DB_PORT} -h${DB_SVR} -e"${SCHQRY}" 2>/dev/null`
    UNION_ALL_QRY=""
    
    echo "${SCHLST}"
    # Schl Loop
    for SCHCD in ${SCHLST}
    do
        SCH_CNT_QRY=" SELECT X.OFEC_CD
            , X.SCHL_TY_CD
            , COUNT(DISTINCT CASE WHEN X.UTLE_MBY_TRGT_CD = 2 THEN X.USPS_SQNO END) STD_UNIQUE
            , COUNT(CASE WHEN X.UTLE_MBY_TRGT_CD = 2 THEN X.USPS_SQNO END) STD_DUP
            , COUNT(DISTINCT CASE WHEN X.UTLE_MBY_TRGT_CD = 3 THEN X.USPS_SQNO END) TCH_UNIQUE
            , COUNT(CASE WHEN X.UTLE_MBY_TRGT_CD = 3 THEN X.USPS_SQNO END) TCH_DUP
        FROM (
            SELECT IFNULL(B.OFEC_CD, '${OFEC_CD}') AS OFEC_CD
                , B.SCHL_TY_CD
                , A.PRTCN_BGN_DT 
                , A.USPS_SQNO 
                , B.UTLE_MBY_TRGT_CD 
            FROM ${SCHCD}.LCT_CLASS_ALL_VCLS_PRTCN_HIST A
            LEFT JOIN ${SCHCD}.USR_USPS_SCHL B    
            ON B.USPS_SQNO = A.USPS_SQNO 
            WHERE A.PRTCN_BGN_DT >= ${FROM_DT} 
            AND A.PRTCN_BGN_DT < ${TO_DT}
            AND A.DEL_YN = 'N'
        ) X "

        if [ -z "${UNION_ALL_QRY}" ]
        then
            UNION_ALL_QRY="${SCH_CNT_QRY}"
        else
            UNION_ALL_QRY="UNION ALL ${SCH_CNT_QRY}"
        fi
        echo "${UNION_ALL_QRY}" >> "./output/${OFEC_CD}.sql_temp"
    done

    if [ -f "./output/${OFEC_CD}.sql_temp" ]
    then
        cp "./output/${OFEC_CD}.sql_temp" "./output/${OFEC_CD}.sql"
    
        # Last Append
        echo ") X GROUP BY SCHL_TY_CD ORDER BY SCHL_TY_CD;" >> "./output/${OFEC_CD}.sql"
        sed -i '1iSELECT OFEC_CD, SCHL_TY_CD, SUM(STD_UNIQUE) , SUM(STD_DUP) , SUM(TCH_UNIQUE), SUM(TCH_DUP) FROM (' "./output/${OFEC_CD}.sql"

        STAT_RESULT=`${MYSQL_PATH}/mysql -N -A --user=${USER_ID} --password=${USER_PWD} --port=${DB_PORT} -h${DB_SVR} < ./"./output/${OFEC_CD}.sql" 2>/dev/null`
        echo ${STAT_RESULT} > "./output/${OFEC_CD}_result.txt"
    fi
done

# result shell
# find . -type f -name "*.txt" | while read LINE;do echo $LINE;cat $LINE;done
