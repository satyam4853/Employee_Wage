#!/bin/bash -x

IS_PART_TIME=1
IS_FULL_TIME=2
EMP_RATE_PER_HR=20
NUMBER_OF_WORKING_DAYS=20
MAX_HRS_IN_MONTH=50

totalEmpHrs=0
totalWorkingDays=0

function getWorkHrs() {
	local empCheck=$1
	empCheck=$((RANDOM%3));
	case $empCheck in
         $IS_FULL_TIME)
            empHrs=8
            ;;
         $IS_PART_TIME)
            empHrs=4
            ;;
         *)
            empHrs=0
            ;;
   esac
	echo $empHrs
}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUMBER_OF_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	empHrs="$( getWorkHrs $empCheck )"
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
done

totalsalary=$(($totalEmpHrs*$EMP_RATE_PER_HR))









