# My own custom header

if [ ! -e $0.started ] ; then 
	touch $0.started
fi



#
## Generated header
#

# Assign values to the parameters in this script

# Set taskId, which is the job name of this task
taskId="step2_0"

# Make compute.properties available
rundir="TEST_PROPERTY(project.basedir)/target/test/benchmark/run"
runid="HVNk"
workflow="src/main/resources/workflows/benchmark/workflow.csv"
parameters="src/main/resources/workflows/benchmark/parameters.csv"
user="TEST_PROPERTY(user.name)"
database="none"
backend="localhost"
port="80"
interval="2000"
path="."
source $ENVIRONMENT_DIR/step1_0.env
source $ENVIRONMENT_DIR/step1_1.env


# Connect parameters to environment
wf="myFirstWorkflow"
date="today"
strings[0]=${step1__has__out[0]}
strings[1]=${step1__has__out[1]}

# Validate that each 'value' parameter has only identical values in its list
# We do that to protect you against parameter values that might not be correctly set at runtime.
if [[ ! $(IFS=$'\n' sort -u <<< "${wf[*]}" | wc -l | sed -e 's/^[[:space:]]*//') = 1 ]]; then echo "Error in Step 'step2': input parameter 'wf' is an array with different values. Maybe 'wf' is a runtime parameter with 'more variable' values than what was folded on generation-time?" >&2; exit 1; fi
if [[ ! $(IFS=$'\n' sort -u <<< "${date[*]}" | wc -l | sed -e 's/^[[:space:]]*//') = 1 ]]; then echo "Error in Step 'step2': input parameter 'date' is an array with different values. Maybe 'date' is a runtime parameter with 'more variable' values than what was folded on generation-time?" >&2; exit 1; fi

#
## Start of your protocol template
#

#string wf
#string date
#list strings

echo "Workflow name: ${wf}"
echo "Created: ${date}"

echo "Result of step1.sh:"
for s in "${strings[@]}"
do
    echo ${s}
done


echo "(FOR TESTING PURPOSES: your runid is ${runid})"

#
## End of your protocol template
#

# Save output in environment file: '$ENVIRONMENT_DIR/step2_0.env' with the output vars of this step

echo "" >> $ENVIRONMENT_DIR/step2_0.env
chmod 755 $ENVIRONMENT_DIR/step2_0.env


# My own custom footer

if [ ! -e $(basename $0 .sh).env ] ; then 
	touch $0.finished
fi