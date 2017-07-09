package com.FamilyEdu.Model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="course")
public class Course {
	
//	主键，自增长
	private int id;
	
//	创建课程用户Id
	private String createId;
	
//	创建课程用户
	private User createUser;
	
//	授课方式
	private String teachMethod;
	
//	授课类型
	private String teachType;
	
//	适教区域
	private String ableArea;
	
//	教授科目
	private String teachSubject;
	
//	适教时间
	private String freeTime;
	
//	发布时间
	private Date releaseDate;
	
//	居住地区
	private String homeArea;
	
//	教学学段
	private String teachPeriod;
	
//	教学年级
	private String teachGrade;
	
//	搜索关键词
	private String keyword;

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

	public String getTeachMethod() {
		return teachMethod;
	}

	public void setTeachMethod(String teachMethod) {
		this.teachMethod = teachMethod;
	}

	public String getTeachType() {
		return teachType;
	}

	public void setTeachType(String teachType) {
		this.teachType = teachType;
	}

	public String getAbleArea() {
		return ableArea;
	}

	public void setAbleArea(String ableArea) {
		this.ableArea = ableArea;
	}

	public String getTeachSubject() {
		return teachSubject;
	}

	public void setTeachSubject(String teachSubject) {
		this.teachSubject = teachSubject;
	}

	public String getFreeTime() {
		return freeTime;
	}

	public void setFreeTime(String freeTime) {
		this.freeTime = freeTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "releaseDate", length = 19)
	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getHomeArea() {
		return homeArea;
	}

	public void setHomeArea(String homeArea) {
		this.homeArea = homeArea;
	}

	@Transient
	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public String getTeachPeriod() {
		return teachPeriod;
	}

	public void setTeachPeriod(String teachPeriod) {
		this.teachPeriod = teachPeriod;
	}

	public String getTeachGrade() {
		return teachGrade;
	}

	public void setTeachGrade(String teachGrade) {
		this.teachGrade = teachGrade;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
