package com.FamilyEdu.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 实体类，用于存储教师学习成果记录
 * @author Gu
 *
 */
@Entity
@Table(name="achievement")
public class Achievement {
	
//	主键，自增长
	private int id;
	
//	用户Id
	private String userId;

//	学习成果图片
	private String achievementImage;
	
//	学习成果标题描述
	private String title;

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

	public String getAchievementImage() {
		return achievementImage;
	}

	public void setAchievementImage(String achievementImage) {
		this.achievementImage = achievementImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	

}
