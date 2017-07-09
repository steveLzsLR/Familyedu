package com.FamilyEdu.Service;

import java.util.List;

import com.FamilyEdu.Model.Achievement;

public interface AchievementService {
	
	/**
	 * 通过用户id查询achievement表里用户学习成果的最大Id
	 * @param userId
	 * @return
	 */
	public int findMaxIdByUserId(String userId);
	
	/**
	 * 添加Achievement
	 * @param achievement
	 */
	public void addAchievement(Achievement achievement);
	
	/**
	 * 根据用户Id获取用户学习成果图片
	 * @param userId
	 * @return
	 */
	public List<Achievement> findAchievementsByUserId(String userId);
	
	/**
	 * 删除学习成果
	 * @param id
	 */
	public void deleteAchievement(String id);
}
