package reminder;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.EmailException;

import com.sun.mail.smtp.SMTPTransport;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;


public class MailReminder
{


    protected String host;
    protected String from;
    
    public MailReminder()
    {
    }

    public String getHost()
    {
        return host;
    }

    public String getFrom()
    {
        return from;
    }

    public void setFrom(String from)
    {
        this.from = from;
    }

    public void setHost(String host)
    {
        this.host = host;
    }

    public void sendMessage(String to, String subject, String body)
        throws EmailException, MessagingException
    {
    	/*Properties props = new Properties();
		props.put("mail.smtp.host", "198.101.12.183");
		props.put("mail.smtp.socketFactory.port", "25");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "25");
  
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("shantanu.pandey@otssolutions.com","shantanu@ots");
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("contact@otssolutions.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
			message.setContent(body, "text/html");
			message.setRecipients(Message.RecipientType.CC,InternetAddress.parse("shantanu.pandey@otssolutions.com"));
 
			Transport.send(message);
 
			
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}*/
    	
    	/*start new mail*/
    	Properties props = System.getProperties();
        props.put("mail.smtps.host","smtp.mailgun.org");
        props.put("mail.smtps.auth","true");
        Session session = Session.getInstance(props, null);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("calba@support.com"));
        msg.setRecipients(Message.RecipientType.TO,
        InternetAddress.parse(to, false));
        msg.setSubject(subject);
        msg.setText(body);
        msg.setRecipients(Message.RecipientType.CC,InternetAddress.parse("shantanu.pandey@otssolutions.com"));
        msg.setContent(body, "text/html");
        SMTPTransport t =  (SMTPTransport)session.getTransport("smtps");
        t.connect("smtp.mailgun.com", "postmaster@sandbox41ca901b03124f828f9d42be86b36b53.mailgun.org", "0ae971c659f2cb0c26ca5840e90fe6be");
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        t.close();
        /*End new mail*/
    	
    	
}}