package com.assignment.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MailInformation {
	private String from = "DoTienThinh<thinhdtps15048@fpt.edu.vn>";
	private String to;
	private String[] cc;
	private String[] bcc;
	private String subject;
	private String body;
	private List<File> files = new ArrayList<>();
	public MailInformation() {
		super();
	}
	public MailInformation(String to, String subject, String body) {
		super();
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
	public MailInformation(String from, String to, String[] cc, String[] bcc, String subject, String body,
			List<File> files) {
		super();
		this.from = from;
		this.to = to;
		this.cc = cc;
		this.bcc = bcc;
		this.subject = subject;
		this.body = body;
		this.files = files;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String[] getCc() {
		return cc;
	}
	public void setCc(String[] cc) {
		this.cc = cc;
	}
	public String[] getBcc() {
		return bcc;
	}
	public void setBcc(String[] bcc) {
		this.bcc = bcc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
	
	
}
