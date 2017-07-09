package com.FamilyEdu.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 学生信息
 * @author Gu
 *
 */
@Entity
@Table(name="student")
public class Student {
	
//	主键，自增长
	private int id;
	
//	创建者Id
	private String createId;
	
//	学生名
	private String stuName;
	
//	学生年龄
	private String stuAge;
	
//	学生性别
	private String stuGender;
	
//	学生学校
	private String stuSchool;
	
//	学生年级
	private String stuGrade;
	
//	学生简介
	private String stuInfo;

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuAge() {
		return stuAge;
	}

	public void setStuAge(String stuAge) {
		this.stuAge = stuAge;
	}

	public String getStuGender() {
		return stuGender;
	}

	public void setStuGender(String stuGender) {
		this.stuGender = stuGender;
	}

	public String getStuSchool() {
		return stuSchool;
	}

	public void setStuSchool(String stuSchool) {
		this.stuSchool = stuSchool;
	}

	public String getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
	}

	@Column(name = "stuInfo", columnDefinition = "TEXT")
	public String getStuInfo() {
		return stuInfo;
	}

	public void setStuInfo(String stuInfo) {
		this.stuInfo = stuInfo;
	}
	
	
}
