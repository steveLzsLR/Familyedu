package com.FamilyEdu.Dao.Impl;

import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.AdminDao;
import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Model.Admin;

@Repository("adminDao")
public class AdminDaoImpl extends BaseDao implements AdminDao{

	@Override
	public Admin isLogin(String username, String password) {
		if(getHibernateTemplate().find("from Admin a where a.username=?", username).isEmpty()){
			return null;
		}
		else{
		Admin a= (Admin) getHibernateTemplate().find("from Admin a where a.username=?", username).get(0);
		if(a.getPassword().equals(password)){
			return a;
		}else{
			return null;
		}
		}
	}

}
