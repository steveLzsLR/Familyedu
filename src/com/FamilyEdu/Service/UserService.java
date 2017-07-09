package com.FamilyEdu.Service;

import java.util.List;
import java.util.Map;

import com.FamilyEdu.Model.User;

public interface UserService {
	
	/**
	 * 添加用户
	 * @param user
	 */
	public void addUser(User user);
	
	/**
	 * 判断邮箱是否已被注册	
	 * @param email
	 * @return
	 */
	public Boolean isRegisterEmail(String email);
	
	/**
	 * 通过validateCode寻找对应用户，如不存在，返回null
	 * @param validateCode
	 * @return
	 */
	public User findUserByValidateCode(String validateCode);
	
	/**
	 * 修改用户
	 * @param u
	 */
	public void updateUser(User u);
	
	/**
	 * 判断登录邮箱密码是否正确，正确返回user对象，错误返回空对象
	 * @param email
	 * @param password
	 * @return
	 */
	public User isLogin(String email,String password);
	
	/**
	 * 通过id获取用户
	 * @param id
	 */
	public User getUser(int id);
	
	/**
	 * 获取最新入驻10位教师
	 * @return
	 */
	public List<User> getNewTeachers();
	
	/**
	 * 根据用户Id数组获取用户数组
	 * @param ids
	 * @return
	 */
	public List<User> getUsersByIds(List<String> ids);
	
	/**
	 * 需找返回正在等待审核的教师
	 * @return
	 */
	public Map<String,Object>  findWaitingValidateTeachers(String page);
	
	/**
	 * 需找返回正在等待审核的家长
	 * @return
	 */
	public  Map<String,Object>  findWaitingValidateParents(String page);
	
	/**
	 * 发送新订单消息
	 * @param username
	 * @param email
	 */
	public void sendNewOrderEamil(String username, String email);
	
	/**
	 * 发送删除订单消息
	 * @param username
	 * @param email
	 * @param reason
	 * @param type
	 */
	public void sendDeleteOrderEamil(String teacherName,String parentName, String email,String reason,String role);
	
	/**
	 * 发送教师确认订单邮件
	 * @param teacherName
	 * @param parentName
	 * @param email
	 */
	public void sendTFirmOrderEmail(String teacherName,String parentName,String email);
}
