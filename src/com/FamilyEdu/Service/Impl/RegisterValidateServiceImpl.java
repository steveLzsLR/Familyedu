package com.FamilyEdu.Service.Impl;

import java.security.GeneralSecurityException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import com.FamilyEdu.Service.RegisterValidateService;
import com.FamilyEdu.Tools.EmailUtil;

@Service("registerValidateService")
public class RegisterValidateServiceImpl implements RegisterValidateService{

	@Override
	public void sendValidateEmail(String username, String email, String validateCode) throws MessagingException, GeneralSecurityException {
		
		//邮件内容
		 StringBuffer sb=new StringBuffer();
		    sb.append("亲爱的"+username+":\n");
		    sb.append("您好！");
			sb.append("您已对启学家教网进行注册，点击链接激活账号:\n");
	        sb.append(EmailUtil.getDomainName()+"/user/userAtivation?"); 
	        sb.append("validateCode=");
	        sb.append(validateCode);
	        sb.append("\n如果点击以上链接没有反应，请将该网址复制并粘贴到新的浏览器窗口中。");
	        sb.append("\n此致\n启学家教网 敬上");
	        
	       //发送邮件
			EmailUtil.send(email, sb.toString());
			

	}

}
