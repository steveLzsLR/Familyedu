package com.FamilyEdu.Service.Impl;

import java.security.GeneralSecurityException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.AdminDao;
import com.FamilyEdu.Model.Admin;
import com.FamilyEdu.Service.AdminService;
import com.FamilyEdu.Tools.EmailUtil;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin isLogin(String username, String password) {
		return adminDao.isLogin(username, password);
	}

	@Override
	public void sendCheckedFailEmail(String username, String email, String reason, String type) {
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		    sb.append("您好,"+username+":\n");
			sb.append("感谢您对启学家教网的支持！\n");
	        sb.append("\n你的"+type+"审核不通过，原因："+reason);
	        sb.append("\n请重新上传图片进行审核");
	        sb.append("\n此致\n启学家教网 敬上");
	        
	   //发送邮件
				try {
					try {
						EmailUtil.send(email, sb.toString());
					} catch (GeneralSecurityException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	}

	@Override
	public void sendCheckedSuccessEmail(String username, String email, String type) {
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		    sb.append("您好,"+username+":\n");
			sb.append("感谢您对启学家教网的支持！\n");
	        sb.append("\n你的"+type+"审核已通过，赶紧登陆启学家教网");
	        if(type.equals("教师资格")){
	        	sb.append("发布课程吧！");	
	        }else {
	        	sb.append("预约家教吧！");	
			}
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
