package com.FamilyEdu.Model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 实体类，用于存储教师学习经历
 * @author Gu
 *
 */
@Entity
@Table(name="experience")
public class Experience {
	
//	主键，自增长
	private int id;
	
//	用户Id
	private String userId;
	
//	开始时间
	private String beginDate;
	
//	结束时间
	private String endDate;
	
//	学生名字
	private String studentName;
	
//	学生所在学校
	private String studentSchool;
	
//	所教科目
	private String teachSubject;
	
//	辅导情况，经验
	private String teachExperience;

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}


	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentSchool() {
		return studentSchool;
	}

	public void setStudentSchool(String studentSchool) {
		this.studentSchool = studentSchool;
	}

	public String getTeachSubject() {
		return teachSubject;
	}

	public void setTeachSubject(String teachSubject) {
		this.teachSubject = teachSubject;
	}

	@Column(name = "teachExperience", columnDefinition = "TEXT")
	public String getTeachExperience() {
		return teachExperience;
	}

	public void setTeachExperience(String teachExperience) {
		this.teachExperience = teachExperience;
	}
	
	
}
