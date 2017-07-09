package com.FamilyEdu.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Dao.CourseDao;
import com.FamilyEdu.Model.Course;

@Repository("courseDao")
public class CourseDaoImpl extends BaseDao implements CourseDao{

	@Override
	public void addCourse(Course course) {
		getHibernateTemplate().save(course);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findCoursesByUserId(String userId) {
		if(getHibernateTemplate().find("from Course c where c.createId=?",userId).isEmpty()){
		return null;
		}else{
			return (List<Course>) getHibernateTemplate().find("from Course c where c.createId=?",userId);
		}
	}

	@Override
	public void deleteCourse(String id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Course.class, Integer.parseInt(id)));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findCoursesByTeachType(String teachType) {
		Query query=getSession().createQuery("from Course c where c.teachType=:teachType group by c.createId order by c.releaseDate desc");
		query.setParameter("teachType", teachType);
		query.setFirstResult(0);
		query.setMaxResults(5);
		return query.list();
	}

	@Override
	public Course getCourse(int id) {
		return getHibernateTemplate().get(Course.class, id);
	}

	@Override
	public Map<String,Object> findCoursesByKeyWord(String keyWord, String page) {
		Query query=getSession().createQuery("from Course c where c.keyword like :keyword group by c.createId");
		query.setParameter("keyword", keyWord);
		int totalPage=(int) Math.ceil(query.list().size()/10.0);
		int size=Integer.parseInt(page)*10-10;
		query.setFirstResult(size);
		query.setMaxResults(10);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("searchResultLists", query.list());
		return map;	
	}

	@Override
	public Map<String, Object> findCourses(String keyWord, String page) {
		Query query=getSession().createQuery("from Course c where c.teachSubject like :keyword group by c.createId");
		query.setParameter("keyword", keyWord);
		int totalPage=(int) Math.ceil(query.list().size()/10.0);
		int size=Integer.parseInt(page)*10-10;
		query.setFirstResult(size);
		query.setMaxResults(10);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("searchResultLists", query.list());
		return map;	
	}

}
