package com.FamilyEdu.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.ExperienceDao;
import com.FamilyEdu.Model.Experience;
import com.FamilyEdu.Service.ExperienceService;

@Service("experienceService")
public class ExperienceServiceImpl implements ExperienceService{

	@Autowired
	private ExperienceDao experienceDao;
	
	@Override
	public void addExperience(Experience experience) {
		experienceDao.addExperience(experience);
	}

	@Override
	public List<Experience> findExperiencesByUserId(String userId) {
		return experienceDao.findExperiencesByUserId(userId);
	}

	@Override
	public void deleteExperience(String id) {
		experienceDao.deleteExperience(id);
		
	}

}
