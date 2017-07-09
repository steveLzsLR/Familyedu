package com.FamilyEdu.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.AchievementDao;
import com.FamilyEdu.Model.Achievement;
import com.FamilyEdu.Service.AchievementService;

@Service("achievementService")
public class AchievementServiceImpl implements AchievementService{
	
	@Autowired
	AchievementDao achievementDao;

	@Override
	public int findMaxIdByUserId(String userId) {
		return achievementDao.findMaxIdByUserId(userId);
	}

	@Override
	public void addAchievement(Achievement achievement) {
		achievementDao.addAchievement(achievement);
	}

	@Override
	public List<Achievement> findAchievementsByUserId(String userId) {
		return achievementDao.findAchievementsByUserId(userId);
	}

	@Override
	public void deleteAchievement(String id) {
		achievementDao.deleteAchievement(id);
		
	}
}
