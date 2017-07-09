package com.FamilyEdu.Service;

import java.util.List;

import com.FamilyEdu.Model.Experience;

public interface ExperienceService {
	
	/**
	 * 添加Experience
	 * @param experience
	 */
	public void addExperience(Experience experience);
	
	/**
	 * 根据用户Id获取教师教学经历
	 * @param userId
	 * @return
	 */
	public List<Experience> findExperiencesByUserId(String userId);
	
	/**
	 * 删除教师教学经历
	 * @param experience
	 */
	public void deleteExperience(String id);
}
