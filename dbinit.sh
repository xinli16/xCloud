#!/bin/bash
##############################################################
# @file dbinit.sh
# @brief create database and tables in mysql
# @author xinli zhang
# @version 1
# @createdate 2018.12.6
# @latestdate 2018.12.6
##############################################################
USER="root"
DATABASE="idb"
TABLE="pics"
PW="idb#123#qwe#"

#create database
mysql -u$USER -p$PW << EOF 2>/dev/null
CREATE DATABASE $DATABASE;
EOF
[ $? -eq 0 ] && echo "created idb" || echo "idb alerady exists"

#create table
mysql -u$USER -p$PW $DATABASE << EOF 2>/dev/null
CREATE TABLE $TABLE(
id int primary key auto_increment not null,
filename varchar(500) not null,
description varchar(500),
make varchar(100),
model varchar(100),
orientation tinyint,
datetime varchar(20),
artist varchar(100),
exposuretime1 bigint,
exposuretime2 bigint,
fnumber1 bigint,
fnumber2 bigint,
exposureprogram tinyint,
datetimeoriginal varchar(20),
lightsource tinyint,
flash tinyint,
lensmake varchar(100),
lensmodel varchar(100),
lenssn varchar(100),
gpslatituderef varchar(2),
gpslatitude1 bigint,
gpslatitude2 bigint,
gpslatitude3 bigint,
gpslatitude4 bigint,
gpslatitude5 bigint,
gpslatitude6 bigint,
gpslongituderef varchar(2),
gpslongitude1 bigint,
gpslongitude2 bigint,
gpslongitude3 bigint,
gpslongitude4 bigint,
gpslongitude5 bigint,
gpslongitude6 bigint,
gpsaltituderef tinyint,
gpsaltitude1 bigint,
gpsaltitude2 bigint,
facecount tinyint
);
EOF
[ $? -eq 0 ] && echo "created table pics" || echo "table pics already exist"

#delete data
mysql -u$USER -p$PW $DATABASE << EOF 2>/dev/null
DELETE FROM $TABLE;
EOF
