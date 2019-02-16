SERVICE=$1
 
function main {
 
	case "$1" in
		ALL)
		stopAllServices
		;;
 
		*)
		stopInQueue $1
		;;	
	esac
}
 
funciton stopAllServices {
# Get all the application IDs into the variable 'result' whose state is RUNNING
result=$(yarn application -list -appStates RUNNING | awk 'NR>2 {print $1}')
 
for applicationId in $result
#For all the application IDs, run the yarn kill command
do
yarn application -kill $applicationId
printf "All jobs are killed"
done