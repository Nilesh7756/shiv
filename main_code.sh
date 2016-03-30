#!/bin/bash

file=/root/Nils/var/log/test_congfig_file.csv
LOG_FILE=/root/Nils/var/log/delet_old.log

main_code()
{
			LOG_PATH=$f1
			DAYS_LOG=$f2
                        TIME_STAMP=`date`

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

while read f1 f2
do	
	main_code f1 f2
done < $file
