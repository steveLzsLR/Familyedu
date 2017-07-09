package com.FamilyEdu.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 管理员表，用于对用户进行资格认证
 * @author Gu
 *
 */
@Entity
@Table(name="admin")
public class Admin {
	
//	主键，自增长
	private int id;
	
//	用户名
	private String username;
	
//	密码
	private String password;

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
