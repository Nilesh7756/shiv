#!/bin/bash

LOG_PATH=$1
DAYS_LOG=$2
TIME_STAMP=`date +%Y:%m:%d`
LOG_FILE=/root/Nils/var/log/delet_old.log

if [ $# == 2 ]
then
{
	echo "###########################################" > $LOG_FILE
	echo "Starting of Script on :$TIME_STAMP" >> $LOG_FILE

	echo "Looking for files in $LOG_PATH" >> $LOG_FILE

	find $LOG_PATH -type f -name "*.log" >> $LOG_FILE

	echo "Zip JOB Started" >> $LOG_FILE

	find $LOG_PATH -type f -name "*.log" -mtime  +1 -exec ls -lrt {} \; >> $LOG_FILE

	echo "Zip JOB Completed" >> $LOG_FILE

	echo "Looking for ZIP files in $LOG_PATH" >> $LOG_FILE

	find $LOG_PATH -type f -name "*.log.gz" >> $LOG_FILE

	echo "Deletion JOB Started" >> $LOG_FILE

	find $LOG_PATH -type f -name "*.log" -mtime  +7 -exec ls -lrt {} \; >> $LOG_FILE

	echo "Deletion JOB Completed" >> $LOG_FILE
	echo "View the LOGS in log file $LOG_FILE "
}
else
{
	echo "Request you to Enter LOG path and days old to delete files"
	echo "Example : sh my_1step.sh /root/Nils/var/log/ 5"
	echo "LOG path: /root/Nils/var/log/ and DAYS older to delete files: 5"
}
fi
