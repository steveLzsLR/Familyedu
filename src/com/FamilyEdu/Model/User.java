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


@Entity
@Table(name="user")
public class User {
	
//	主键，自增长
	private int id;
	
//	做为登录账号
	private String email;
	
//	用户名
	private String username;
	
//	密码
	private String password;
	
//	邮箱激活码
	private String activationCode;
	
//	激活状态，0-未激活，1已激活
	private String activationStatus;
	
//	激活时间
	private Date registerDate;
	
//  用户头像
	private String userImage;
	
//	年龄
	private String age;
	
//	性别
	private String gender;
	
//	学校(在读学校、毕业学校、就职学校等)
	private String school;
	
//	年级(0代表毕业)
	private String grade;
	
//	专业
	private String major;
	
//	身份证图片
	private String idImage;

//	教学证明图片
	private String teachImage;
	
//  教师证件审核状态，0未审核,1提交审核中,2已审核
	private String imageStatus;
	
//	提交教师证件审核时间
	private Date imageStatuDate;
	
//  家长身份审核状态，0未审核,1提交审核中,2已审核
	private String parentStatus;
	
//	提交家长身份审核时间
	private Date parentStatuDate;
	
//  教龄
	private String teachYear;
	
//	个人简介
	private String introduction;
	
//	联系方式
	private String phoneNum;
	
//	住址
	private String address;
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name="password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name="activation_code")
	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	@Column(name="activation_status")
	public String getActivationStatus() {
		return activationStatus;
	}

	public void setActivationStatus(String activationStatus) {
		this.activationStatus = activationStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "register_date", length = 19)
	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@Column(name="userImage")
	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	@Column(name="age")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	@Column(name="gender")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name="school")
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@Column(name="grade")
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Column(name="major")
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getIdImage() {
		return idImage;
	}

	public void setIdImage(String idImage) {
		this.idImage = idImage;
	}

	public String getTeachImage() {
		return teachImage;
	}

	public void setTeachImage(String teachImage) {
		this.teachImage = teachImage;
	}

	public String getImageStatus() {
		return imageStatus;
	}

	public void setImageStatus(String imageStatus) {
		this.imageStatus = imageStatus;
	}

	public String getTeachYear() {
		return teachYear;
	}

	public void setTeachYear(String teachYear) {
		this.teachYear = teachYear;
	}

	@Column(name = "introduction", columnDefinition = "TEXT")
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getParentStatus() {
		return parentStatus;
	}

	public void setParentStatus(String parentStatus) {
		this.parentStatus = parentStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "imageStatuDate", length = 19)
	public Date getImageStatuDate() {
		return imageStatuDate;
	}

	public void setImageStatuDate(Date imageStatuDate) {
		this.imageStatuDate = imageStatuDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "parentStatuDate", length = 19)
	public Date getParentStatuDate() {
		return parentStatuDate;
	}

	public void setParentStatuDate(Date parentStatuDate) {
		this.parentStatuDate = parentStatuDate;
	}
	
}
