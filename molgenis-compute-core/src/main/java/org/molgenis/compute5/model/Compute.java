package org.molgenis.compute5.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.molgenis.compute5.ComputeProperties;
import org.molgenis.compute5.generators.BatchAnalyser;
import org.molgenis.compute5.model.impl.FoldParametersImpl;
import org.molgenis.compute5.model.impl.WorkflowImpl;

public class Compute
{
	private WorkflowImpl workflowImpl;
	private Parameters parameters;
	private List<Task> tasks;
	private ComputeProperties computeProperties;
	private String userEnvironment;

	HashMap<String, String> mapUserEnvironment = null;
	private FoldParametersImpl parametersContainer;

    private BatchAnalyser batchAnalyser = null;

	public Compute(ComputeProperties computeProperties)
	{
		this.setComputeProperties(computeProperties);
	}

	public List<Task> getTasks()
	{
		return tasks;
	}

	public void setTasks(List<Task> tasks)
	{
		this.tasks = tasks;
	}

	public WorkflowImpl getWorkflow()
	{
		return workflowImpl;
	}

	public void setWorkflow(WorkflowImpl workflowImpl)
	{
		this.workflowImpl = workflowImpl;
	}

	public Parameters getParameters()
	{
		return parameters;
	}

	public void setParameters(Parameters parameters)
	{
		this.parameters = parameters;
	}

	public ComputeProperties getComputeProperties()
	{
		return computeProperties;
	}

	public void setComputeProperties(ComputeProperties computeProperties)
	{
		this.computeProperties = computeProperties;
	}

	public void setUserEnvironment(String environment)
	{
		this.userEnvironment = environment;		
	}

	public String getUserEnvironment()
	{
		return this.userEnvironment;
	}

	public HashMap<String, String> getMapUserEnvironment()
	{
		return mapUserEnvironment;
	}

	public void setMapUserEnvironment(HashMap<String, String> mapUserEnvironment)
	{
		this.mapUserEnvironment = mapUserEnvironment;
	}

	public void setParametersContainer(FoldParametersImpl parametersContainer)
	{
		this.parametersContainer = parametersContainer;
	}

	public FoldParametersImpl getParametersContainer()
	{
		return parametersContainer;
	}

    public void createBatchAnalyser(String batchVariable, int batchNumber)
    {
        batchAnalyser = new BatchAnalyser(batchVariable, batchNumber);
    }

    public int getBatchNumber(Map<String, Object> map)
    {
        return batchAnalyser.getBatchNum(map);
    }

    public int getBatchesSize()
    {
        return batchAnalyser.getBatchesSize();
    }
}