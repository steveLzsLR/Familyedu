package com.FamilyEdu.Tools;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.Date;
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
 * @author lirong 发送邮件类
 *
 */
public class EmailUtil {
	
	private static InputStream in;
	private static Properties pro;
	private static String userName; //用户名
	private static String password; //密码
	private static String protocol; //协议
	private static String host; //邮件服务器主机
	private static String authModel; //用户是否用密码认证
	private static String debugModel;//是否处于debug模式
	private static String domainName=""; //本网站域名
	public static String getDomainName() {
		return domainName;
	}

	static{
		 in = EmailUtil.class.getClassLoader().getResourceAsStream("emailAndWebsite.properties");
		 pro=new Properties();
		 try {
		 pro.load(in);
		 protocol = pro.getProperty("mail.transport.protocol"); //获取邮件发送协议
		 host=pro.getProperty("mail.smtp.host"); //获取邮件服务器主机名
    	 authModel=pro.getProperty("mail.smtp.auth"); //是否密码认证
		 debugModel=pro.getProperty("mail.debug");  //是否debug模式
		 userName=pro.getProperty("mail.userName"); //连接邮件服务器的用户名
		 password=pro.getProperty("mail.sslpassword"); //密码
		 domainName=pro.getProperty("domainName");  //设置域名
		} catch (IOException e) {
			try {
				in.close();
			} catch (Exception e1) {
				if(in!=null){
					in=null;
				}
			}
		}
		 
	}
	
	/**发送email
	 * @param toEmail
	 * @param content
	 * @throws MessagingException 
	 * @throws GeneralSecurityException 
	 */
	public static void send(String toEmail, String content) throws MessagingException, GeneralSecurityException {
		Properties props = new Properties();
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", authModel);
		props.setProperty("mail.debug", debugModel);
		// 设置邮件服务器主机名
		props.setProperty("mail.host", host);
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", protocol);
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);
		Session session = Session.getInstance(props);
		Message msg = new MimeMessage(session);
		msg.setSubject("启学家教网");
		msg.setSentDate(new Date());
		msg.setText(content);
		msg.setFrom(new InternetAddress(userName));
		msg.saveChanges();
		Transport transport = session.getTransport();
		transport.connect(host, userName, password);
		transport.sendMessage(msg, new Address[] { new InternetAddress(toEmail) });
		transport.close();
	}
}
