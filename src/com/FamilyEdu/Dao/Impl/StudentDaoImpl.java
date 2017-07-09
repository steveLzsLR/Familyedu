package com.FamilyEdu.Dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Dao.StudentDao;
import com.FamilyEdu.Model.Student;

@Repository("studentDao")
public class StudentDaoImpl extends BaseDao implements StudentDao{

	@Override
	public void addStudent(Student student) {
		getHibernateTemplate().save(student);
		
	}

	@Override
	public void deleteStudent(String id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Student.class, Integer.parseInt(id)));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findStudentsByCreateId(String createId) {
		if(getHibernateTemplate().find("from Student s where s.createId=?", createId).isEmpty()){
			return null;
		}else {
			return (List<Student>) getHibernateTemplate().find("from Student s where s.createId=?", createId);
		}
	}

	@Override
	public Student getStudent(int id) {
		return getHibernateTemplate().get(Student.class, id);
	}
	
	
}
