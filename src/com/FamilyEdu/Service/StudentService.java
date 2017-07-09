package com.FamilyEdu.Service;

import java.util.List;

import com.FamilyEdu.Model.Student;

public interface StudentService {

	/**
	 * 添加学生
	 * @param student
	 */
	public void addStudent(Student student);
	
	/**
	 * 删除学生
	 * @param id
	 */
	public void deleteStudent(String id);
	
	
	/**
	 * 根据创建者Id找到对应学生
	 * @param createId
	 * @return
	 */
	public List<Student> findStudentsByCreateId(String createId);
	
	/**
	 * 根据id找到对应学生
	 * @param id
	 * @return
	 */
	public Student getStudent(int id);
}
