package com.FamilyEdu.Dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.AchievementDao;
import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Model.Achievement;

@Repository("achievementDao")
public class AchievementDaoImpl extends BaseDao implements AchievementDao{

	@Override
	public int findMaxIdByUserId(String userId) {
		
		if(getHibernateTemplate().find("from Achievement a where a.userId=?", userId).isEmpty()){
			return 0;
		}else{
			Achievement a=(Achievement) getHibernateTemplate().find("from Achievement a where a.userId=? order by a.id desc", userId).get(0);
			return a.getId();
		}
	}

	@Override
	public void addAchievement(Achievement achievement) {
		getHibernateTemplate().save(achievement);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Achievement> findAchievementsByUserId(String userId) {
		
		if(getHibernateTemplate().find("from Achievement a where a.userId=?", userId).isEmpty()){
			return null;
		}else{
			return (List<Achievement>) getHibernateTemplate().find("from Achievement a where a.userId=?", userId);
		}
	}

	@Override
	public void deleteAchievement(String id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Achievement.class, Integer.parseInt(id)));
	}

}
