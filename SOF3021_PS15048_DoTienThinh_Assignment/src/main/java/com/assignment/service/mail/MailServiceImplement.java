package com.assignment.service.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.assignment.model.MailInformation;
@Service
public class MailServiceImplement implements MailService{
	private List<MailInformation> listMails = new ArrayList<>();
	@Autowired
	JavaMailSender sender;
	
	@Override
	public void send(MailInformation mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		messageHelper.setFrom(mail.getFrom());
		messageHelper.setTo(mail.getTo());
		messageHelper.setSubject(mail.getSubject());
		messageHelper.setText(mail.getBody(), true);
		messageHelper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();// ktra mang cc co ton tai hay khong
		if (cc != null && cc.length > 0) {
			messageHelper.setCc(cc);
		}
		String[] bcc = mail.getBcc();// ktra mang bcc co ton tai hay khong
		if (bcc != null && bcc.length > 0) {
			messageHelper.setBcc(bcc);
		}
		
		List<File> files = mail.getFiles();// mang file
		if (files.size()>0) {
			for (File file:files) {
				messageHelper.addAttachment(file.getName(), file);
			}
		}
		// Gửi message đến SMTP server
		sender.send(message);
		
	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInformation(to, subject, body));
		
	}

	@Override
	public void queue(MailInformation mail) {
		listMails.add(mail);
		
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInformation(to, subject, body));
		
	}
	
	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!listMails.isEmpty()) {
			MailInformation mail = listMails.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
