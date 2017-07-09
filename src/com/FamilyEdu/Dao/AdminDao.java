package com.FamilyEdu.Dao;

import com.FamilyEdu.Model.Admin;

public interface AdminDao {

	/**
	 * 判断管理员用户名密码是否正确，正确返回admin对象，错误返回空对象
	 * @param username
	 * @param password
	 * @return
	 */
	public Admin isLogin(String username,String password);
}
