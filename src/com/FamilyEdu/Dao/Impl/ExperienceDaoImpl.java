package com.FamilyEdu.Dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Dao.ExperienceDao;
import com.FamilyEdu.Model.Experience;

@Repository("experienceDao")
public class ExperienceDaoImpl extends BaseDao implements ExperienceDao{

	@Override
	public void addExperience(Experience experience) {
		getHibernateTemplate().save(experience);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Experience> findExperiencesByUserId(String userId) {
		if(getHibernateTemplate().find("from Experience e where e.userId=?", userId).isEmpty()){
			return null;
		}else{
			return (List<Experience>) getHibernateTemplate().find("from Experience e where e.userId=?", userId);
		}
	}

	@Override
	public void deleteExperience(String id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Experience.class, Integer.parseInt(id)));
		
	}

}
