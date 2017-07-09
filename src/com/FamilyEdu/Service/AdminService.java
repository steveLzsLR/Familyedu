package com.FamilyEdu.Service;

import com.FamilyEdu.Model.Admin;

public interface AdminService {

	/**
	 * 判断管理员用户名密码是否正确，正确返回admin对象，错误返回空对象
	 * @param username
	 * @param password
	 * @return
	 */
	public Admin isLogin(String username,String password);
	
	/**
	 * 审核不通过，发送审核失败邮件
	 * @param username
	 * @param email
	 */
	public void sendCheckedFailEmail(String username, String email, String reason, String type);
	
	/**
	 * 审核不通过，发送审核成功邮件
	 * @param username
	 * @param email
	 */
	public void sendCheckedSuccessEmail(String username, String email,  String type);
}
