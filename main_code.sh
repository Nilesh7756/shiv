#!/bin/bash

#Declaring Configuration file, file consist of LOG deletion path and Number of days to delete old files.
file=/root/Nils/var/log/test_congfig_file.csv

#Declaring LOG file to generate LOGS of this script
LOG_FILE=/root/Nils/var/log/delet_old.log

#Clearing LOG file
echo " " > $LOG_FILE

#Main code declaration
main_code()
{
			LOG_PATH=$f1
			DAYS_LOG=$f2
                        TIME_STAMP=`date`

                        echo "################################################\n" >> $LOG_FILE

			echo "" >> $LOG_FILE

                        echo "Starting of Script on :$TIME_STAMP" >> $LOG_FILE
			
			echo ""	>> $LOG_FILE
	
			echo "Executing Script for Log Path $f1 and Number of days to delete LOG file $f2" >> $LOG_FILE
		
			echo "" >> $LOG_FILE

                        echo "Looking for files in $LOG_PATH" >> $LOG_FILE

                        find $LOG_PATH -type f -name "*.log" >> $LOG_FILE

			echo "" >> $LOG_FILE

			echo "Zip JOB Started" >> $LOG_FILE

                        find $LOG_PATH -type f -name "*.log" -mtime  +1 -exec ls -lrt {} \; >> $LOG_FILE

                        echo "Zip JOB Completed" >> $LOG_FILE

			printf "\n****************************************************************"	>> $LOG_FILE

			echo "" >> $LOG_FILE

			echo "Looking for ZIP files in $LOG_PATH" >> $LOG_FILE

                        find $LOG_PATH -type f -name "*.log.gz" >> $LOG_FILE

			echo "" >> $LOG_FILE

                        echo "Deletion JOB Started" >> $LOG_FILE

                        find $LOG_PATH -type f -name "*.log" -mtime  +$f2 -exec ls -lrt {} \; >> $LOG_FILE

                        echo "Deletion JOB Completed" >> $LOG_FILE

			echo "#####################################################################" >> $LOG_FILE
}

#Calling configuration while through WHILE LOOP
while read f1 f2
do	
	#Calling main_code FUNCTION
	main_code f1 f2
done < $file


echo "View the LOGS in log file $LOG_FILE "
