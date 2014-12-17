package net.calba.backpain.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import net.calba.backpain.CalbaAppConstant;
import net.calba.backpain.Util;
import net.calba.backpain.dao.mybatis.HeightUnitsMapper;
import net.calba.backpain.dao.mybatis.ProjectMapper;
import net.calba.backpain.dao.mybatis.WeightUnitsMapper;
import net.calba.backpain.model.HeightUnits;
import net.calba.backpain.model.HeightUnitsExample;
import net.calba.backpain.model.Project;
import net.calba.backpain.model.ProjectExample;
import net.calba.backpain.model.WeightUnits;
import net.calba.backpain.model.WeightUnitsExample;
import net.calba.backpain.service.CalbaService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("calbaService")
public class CalbaServiceImpl implements CalbaService {
	
	
	private static final Logger LOGGER = Logger
			.getLogger(CalbaServiceImpl.class);
	
	@Autowired
	WeightUnitsMapper weightUnitsMapper;

	@Autowired
	HeightUnitsMapper heightUnitsMapper;
	
	@Autowired
	ProjectMapper projectMapper;
	
	private List<HeightUnits> heightUnits;
	
	private List<WeightUnits> weightUnits;
	
	
	private List<Project> trialProjects;
	
	
	@PostConstruct
	public final  void init() {
		WeightUnitsExample example = new WeightUnitsExample();
		weightUnits = weightUnitsMapper.selectByExample(example);
		HeightUnitsExample hUnitsExampl = new HeightUnitsExample();
		heightUnits = heightUnitsMapper.selectByExample(hUnitsExampl);
		
		ProjectExample  projectExample = new ProjectExample();
		ProjectExample.Criteria criteria = projectExample.createCriteria();
		criteria.andProjectIdGreaterThan(new Long(CalbaAppConstant.DIRECT_USER_PROJECT_ID));
		criteria.andProjectEndDateGreaterThan(Util.getTodayDate());
		criteria.andProjectStartDateLessThanOrEqualTo(Util.getTodayDate());
		
		trialProjects = projectMapper.selectByExample(projectExample);
		
		LOGGER.debug("Trial Project size : " + trialProjects.size() );	
		
	}


	public List<HeightUnits> getHeightUnits() {
		return heightUnits;
	}


	public List<WeightUnits> getWeightUnits() {
		return weightUnits;
	}
	
	
	public  List<Project> getActiveTrialProjects() {
		return trialProjects;
	}
	
	public Project getProject(Long projectId) {
		return projectMapper.selectByPrimaryKey(projectId);
	}
	
	

}
