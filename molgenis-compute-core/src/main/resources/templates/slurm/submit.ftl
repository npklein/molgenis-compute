# First cd to the directory with the *.sh and *.finished scripts
<#noparse>
MOLGENIS_scriptsDir=$( cd -P "$( dirname "$0" )" && pwd )
echo "cd $MOLGENIS_scriptsDir"
cd $MOLGENIS_scriptsDir
cd ../
runnumber=`pwd`
echo basename $runnumber
run=$(basename $runnumber)

cd ..
project=`pwd`
projectName=$(basename $project)
cd $MOLGENIS_scriptsDir
</#noparse>

touch molgenis.submit.started

# Use this to indicate that we skip a step
skip(){
echo "0: Skipped --- TASK '$1' --- ON $(date +"%Y-%m-%d %T")" >> molgenis.skipped.log
}
<#noparse>echo -e "../../../../tmp/submits/${projectName}_${run}.txt" > zubmitted_jobIDs.txt</#noparse>

<#foreach t in tasks>
#
##${t.name}
#

# Skip this step if step finished already successfully
if [ -f ${t.name}.sh.finished ]; then
skip ${t.name}.sh
echo "Skipped ${t.name}.sh"
else
# Build dependency string
dependenciesExist=false
dependencies="--dependency=afterok"
    <#foreach d in t.previousTasks>
    if [[ -n "$${d}" ]]; then
    dependenciesExist=true
    dependencies="<#noparse>${dependencies}</#noparse>:$${d}"
    fi
    </#foreach>
if ! $dependenciesExist; then
unset dependencies
fi
output=$(sbatch $dependencies ${t.name}.sh)
id=${t.name}
${t.name}=<#noparse>${output##"Submitted batch job "}</#noparse>
echo "$id:$${t.name}"<#noparse> | tee -a ../../../../tmp/submits/${projectName}_${run}.txt</#noparse>
echo "$id:$${t.name}" >> zubmitted_jobIDs.txt
fi

</#foreach>
<#noparse> echo "jobIDs are in ../../../../tmp/submits/${projectName}_${run}.txt"
chmod g+w ../../../../tmp/submits/${projectName}_${run}.txt
chmod g+w zubmitted_jobIDs.txt
</#noparse>
touch molgenis.submit.finished
