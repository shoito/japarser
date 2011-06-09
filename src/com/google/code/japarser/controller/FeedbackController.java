package com.google.code.japarser.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.RequestLocator;
import org.slim3.util.ResponseLocator;

public class FeedbackController extends Controller {

	@Override
	public Navigation run() throws Exception {
		String name = RequestLocator.get().getParameter("name");
		String email = RequestLocator.get().getParameter("email");	
		String message = RequestLocator.get().getParameter("message");
		
		sendMail("sho.ito@change-vision.com", name, email, message);
		
		PrintWriter writer = ResponseLocator.get().getWriter();
		writer.write("success");
		writer.close();
		
		return null;
	}
	
	private void sendMail(String to, String senderName, String from, String message) throws UnsupportedEncodingException, MessagingException {
		InternetAddress address = new InternetAddress(to, senderName, "iso-2022-jp");
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        
		MimeMessage mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(address);
		mimeMessage.addRecipient(Message.RecipientType.TO, address);

		mimeMessage.setSubject("Japarser Feedback", "iso-2022-jp");
		mimeMessage.setText(message);
		Transport.send(mimeMessage);
	}
}