package com.FamilyEdu.Dao;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 * 用于创建Session
 * @author Gu
 *
 */
public class BaseDao extends HibernateDaoSupport{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory1(SessionFactory sessionFactory){
		 super.setSessionFactory(sessionFactory);  
	}
	
	public BaseDao(){}
	
	public BaseDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession() throws HibernateException {
		Session sess = sessionFactory.getCurrentSession();
		if (sess == null) {
			sess = sessionFactory.openSession();
		}
		return sess;
	}
}
