package com.FamilyEdu.Service.Impl;

import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.UserDao;
import com.FamilyEdu.Model.User;
import com.FamilyEdu.Service.UserService;
import com.FamilyEdu.Tools.EmailUtil;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	public Boolean isRegisterEmail(String email) {
		return userDao.isRegisterEmail(email);
	}

	@Override
	public User findUserByValidateCode(String validateCode) {
		return userDao.findUserByValidateCode(validateCode);
	}

	@Override
	public void updateUser(User u) {
		userDao.updateUser(u);
	}

	@Override
	public User isLogin(String email, String password) {
		return userDao.isLogin(email, password);
	}

	@Override
	public User getUser(int id) {
		return userDao.getUser(id);
	}

	@Override
	public List<User> getNewTeachers() {
		return userDao.getNewTeachers();
	}

	@Override
	public List<User> getUsersByIds(List<String> ids) {
		return userDao.getUsersByIds(ids);
	}

	@Override
	public Map<String,Object>  findWaitingValidateTeachers(String page) {
		return userDao.findWaitingValidateTeachers(page);
	}

	@Override
	public  Map<String,Object>  findWaitingValidateParents(String page) {
		return userDao.findWaitingValidateParents(page);
	}

	@Override
	public void sendNewOrderEamil(String username, String email) {
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		    sb.append("您好,"+username+":\n");
			sb.append("感谢您对启学家教网的支持！\n");
	        sb.append("\n您有新的订单消息,赶紧到启学家教网个人中心查看吧！");
	        sb.append("\n "+EmailUtil.getDomainName()+"/");
	        sb.append("\n此致\n启学家教网 敬上");
	        
	   //发送邮件
				try {
					try {
						EmailUtil.send(email, sb.toString());
					} catch (GeneralSecurityException e) {
						e.printStackTrace();
					}
				} catch (MessagingException e) {
					e.printStackTrace();
				}
	}

	@Override
	public void sendDeleteOrderEamil(String teacherName,String parentName, String email, String reason, String role) {
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		 if(role.equals("家长")){
		    sb.append("您好,"+teacherName+":\n");
		    sb.append("感谢您对启学家教网的支持！\n");
		    sb.append("\n家长 "+parentName+" 取消了与您的一笔订单，原因是："+reason);
		 }else{
			  sb.append("您好,"+parentName+":\n");
			  sb.append("感谢您对启学家教网的支持！\n");
			  sb.append("\n教师 "+teacherName+" 取消了与您的一笔订单，原因是："+reason);
		 }
	        sb.append("\n此致\n启学家教网 敬上");
	        
	   //发送邮件
				try {
					try {
						EmailUtil.send(email, sb.toString());
					} catch (GeneralSecurityException e) {
						e.printStackTrace();
					}
				} catch (MessagingException e) {
					e.printStackTrace();
				} 
	}

	@Override
	public void sendTFirmOrderEmail(String teacherName, String parentName, String email) {
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		    sb.append("您好,"+parentName+":\n");
			sb.append("感谢您对启学家教网的支持！\n");
	        sb.append("\n教师 "+teacherName+" 已确认了您的一笔订单,赶紧到启学家教网个人中心查看吧！");
	        sb.append("\n "+EmailUtil.getDomainName()+"/");
	        sb.append("\n此致\n启学家教网 敬上");
	        
	   //发送邮件
				try {
					try {
						EmailUtil.send(email, sb.toString());
					} catch (GeneralSecurityException e) {
						e.printStackTrace();
					}
				} catch (MessagingException e) {
					e.printStackTrace();
				} 
	}

}
