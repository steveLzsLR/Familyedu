package com.FamilyEdu.Service;

import java.security.GeneralSecurityException;

import javax.mail.MessagingException;

/**
 * 用于邮箱验证
 * @author lirong
 */
public interface RegisterValidateService {
	
	public void sendValidateEmail(String username,String email,String validateCode)throws MessagingException, GeneralSecurityException; 
	
}
