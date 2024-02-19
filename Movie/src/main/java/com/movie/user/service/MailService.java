package com.movie.user.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {

	private final JavaMailSender javaMailSender;
	private static final String senderEmail  =  "rladlarb123@gmail.com";
	private static int   number;
	public static void createNumber() {
		number = (int)(Math.random() * (90000)) + 100000;
	}
	public MimeMessage CreateMail(String u_email) {
		createNumber();
		MimeMessage message  =  javaMailSender.createMimeMessage();
		
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, u_email);
			message.setSubject("Movie Site 이메일 인증");
			String body = "";
			body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
			body += "<h1>" + number + "</h1>";
			body += "<h3>" + "감사합니다." + "</h3>";
			message.setText(body, "UTF-8", "html");
		}catch (MessagingException e) {
			e.printStackTrace();
		}
		return message;
	}
	public int sendMail(String u_email) {
		
		MimeMessage message  =  CreateMail(u_email);
		
		javaMailSender.send(message);
		
		return number;
	}
}
