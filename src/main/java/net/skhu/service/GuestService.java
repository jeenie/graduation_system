package net.skhu.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class GuestService {
	
	static String save = null;
	
	public void sendEmail(String email) throws IOException {
		Properties mailAdmistrator = new Properties();
		String path = GuestService.class.getResource("").getPath();
		FileInputStream fis = new FileInputStream(path + "mailAdmistrator.properties");
		mailAdmistrator.load(fis);
		String host = mailAdmistrator.getProperty("host");
		final String username = mailAdmistrator.getProperty("username");
		final String password = mailAdmistrator.getProperty("password");
		int port= Integer.valueOf(mailAdmistrator.getProperty("port")); //포트번호
		
		//메일 내용
		save = getRandomPassword(10);
		
		//받는 사람의 이메일
		String recipient = email;
		//메일 제목
		String title = "SKHU졸업관리시스템에서 인증 번호를 발송했습니다.";
		//메일내용
		String body = "비밀번호 재설정을 위한 인증번호는 :" + save + "입니다.";
		
		try {
			Properties props = System.getProperties();
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host); //Session 생성
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un = username;
				String pw = password;
				
				@Override
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			session.setDebug(true);
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("gno0929@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅
			mimeMessage.setSubject(title); //제목
			mimeMessage.setText(body); //내용
			Transport.send(mimeMessage);
		} catch(MessagingException e) {
			e.printStackTrace();
		}finally {
			fis.close();
		}
	}
	
	public static String getRandomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0; 
		StringBuffer sb = new StringBuffer();
		System.out.println("charSet.length :::: "+charSet.length);
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			System.out.println("idx :::: "+idx); 
			sb.append(charSet[idx]); 
		}
		return sb.toString(); 
	}
}

