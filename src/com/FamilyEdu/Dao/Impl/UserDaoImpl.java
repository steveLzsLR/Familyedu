package com.FamilyEdu.Dao.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Dao.UserDao;
import com.FamilyEdu.Model.User;
import com.FamilyEdu.Tools.Md5Util;

@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao{

	@Override
	public void addUser(User user) {
		getHibernateTemplate().save(user);
		
	}

	@Override
	public Boolean isRegisterEmail(String email) {
		if(getHibernateTemplate().find("from User u where u.email=?", email).isEmpty()){
			return false;//查询为空说明不存在重复email
		}
		return true;//存在重复email
	}

	@Override
	public User findUserByValidateCode(String validateCode) {
		if(getHibernateTemplate().find("from User u where u.activationCode=?", validateCode).isEmpty()){
			return null;
		}
		else{
		return (User) getHibernateTemplate().find("from User u where u.activationCode=?", validateCode).get(0);
		}
	}

	@Override
	public void updateUser(User u) {
		getHibernateTemplate().update(u);	
	}

	@Override
	public User isLogin(String email, String password) {
		if(getHibernateTemplate().find("from User u where u.email=?", email).isEmpty()){
			return null;
		}
		else{
		User u= (User) getHibernateTemplate().find("from User u where u.email=?", email).get(0);
		if(u.getPassword().equals(Md5Util.getMD5Str(password))){
			return u;
		}else{
			return null;
		}
		}
	}

	@Override
	public User getUser(int id) {
		return getHibernateTemplate().get(User.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getNewTeachers() {
		Query query=getSession().createQuery("from User u where u.imageStatus=2 order by u.registerDate desc");
		query.setFirstResult(0);
		query.setMaxResults(10);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsersByIds(List<String> ids) {
		List<Integer> userIds=new ArrayList<>();
		for(String id:ids){
			int i=Integer.parseInt(id);
			userIds.add(i);
		}
		Query query=getSession().createQuery("from User u where u.id in (:userIds)");
		query.setParameterList("userIds", userIds);
		return query.list();
	}

	@Override
	public Map<String,Object> findWaitingValidateTeachers(String page) {
		Query query=getSession().createQuery("from User u where u.imageStatus=1 order by u.imageStatuDate");
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("teachers", query.list());
		return map;
	}

	@Override
	public Map<String,Object> findWaitingValidateParents(String page) {
		Query query=getSession().createQuery("from User u where u.parentStatus=1 order by u.parentStatuDate");
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("parents", query.list());
		return map;
	}

}
