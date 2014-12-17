package net.calba.backpain.service;

import java.util.List;

import net.calba.backpain.model.HeightUnits;
import net.calba.backpain.model.Project;
import net.calba.backpain.model.WeightUnits;

public interface CalbaService {
	
	/**
	 * Get all HeightUnits.
	 * @return List<HeightUnits>
	 */
	public List<HeightUnits> getHeightUnits();
	
	/**
	 * Get all WeightUnits.
	 * @return List<WeightUnits>
	 */
	public List<WeightUnits> getWeightUnits();
	
	/**
	 * Get All trial active projects.
	 * @return List<Project>
	 */
	public  List<Project> getActiveTrialProjects();
	
	/**
	 * Get Project by id.
	 * @param projectId Long
	 * @return Project
	 */
	public Project getProject(Long projectId);

}
