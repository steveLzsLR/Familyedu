package com.FamilyEdu.Tools;


import java.security.GeneralSecurityException;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * 用以发送邮件
 * 
 * @author Gu
 *
 */
public class SendEmail {
	public static void send(String toEmail, String content) throws MessagingException, GeneralSecurityException {
		Properties props = new Properties();
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.host", "smtp.qq.com");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", "smtp");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);
		Session session = Session.getInstance(props);
		Message msg = new MimeMessage(session);
		msg.setSubject("家教网");
		msg.setText(content);
		msg.setFrom(new InternetAddress("family_edu@qq.com"));
		Transport transport = session.getTransport();
		transport.connect("smtp.qq.com", "family_edu@qq.com", "cijzrankehebbigf");
		transport.sendMessage(msg, new Address[] { new InternetAddress(toEmail) });
		transport.close();
	}
}
