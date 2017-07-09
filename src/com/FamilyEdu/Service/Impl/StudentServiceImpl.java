package com.FamilyEdu.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.StudentDao;
import com.FamilyEdu.Model.Student;
import com.FamilyEdu.Service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public void addStudent(Student student) {
		studentDao.addStudent(student);
	}

	@Override
	public void deleteStudent(String id) {
		studentDao.deleteStudent(id);
	}

	@Override
	public List<Student> findStudentsByCreateId(String createId) {
		return studentDao.findStudentsByCreateId(createId);
	}

	@Override
	public Student getStudent(int id) {
		return studentDao.getStudent(id);
	}

}
