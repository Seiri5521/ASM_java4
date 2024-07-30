package com.poly.Service;

import javax.servlet.ServletContext;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

import com.poly.Entity.Accounts;
import com.poly.Util.SendEmailUtils;

public class EmailServiceImpl implements EmailService {
	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to HIUN Shop";
	private static final String EMAIL_FORGOT_PASSWORD = "HIUN Shop - New Password";
	private static final String EMAIL_SHARE_VIDEOS = "HIUN Shop - Another has just send the products to you!!!";
	@Override
	public void sendMail(ServletContext context, Accounts recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String accounts = context.getInitParameter("accounts");
		String pass = context.getInitParameter("pass");
		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Gửi " + recipient.getUsername() +"hy vọng bạn có thời gian tốt nhất!!";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Gửi " + recipient.getUsername() + ", mật khẩu mới của bạn ở đây:" + recipient.getPassword();
				break;
			case "share":
				subject = EMAIL_SHARE_VIDEOS;
				content =  recipient.getUsername() + "vừa gửi sản phẩm cho bạn!";
				break;
			default:
				subject = "HIUN Dự án";
				content = "Email này không tồn tại! Kiểm tra nó!!";
			}
			SendEmailUtils.sendEmail(host, port, accounts, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}

}
