package net.calba.backpain;

import javax.mail.internet.MimeMessage;

import net.calba.backpain.model.Client;
import net.calba.backpain.model.Email;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class PasswordRecoveryMessagePreparator implements MimeMessagePreparator {
	
	public static final String SUBJECT = "Your Calba password has been reset";
	
	
	private Client client;
	private Email email;
	private String subject;
	
	
	
	

	public PasswordRecoveryMessagePreparator(Client client,	Email email) {
		
		this.client = client;
		this.email = email;		
		 subject = SUBJECT;
	}

	public void prepare(MimeMessage mimeMessage) throws Exception {
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		
		mimeMessageHelper.setTo(email.getEmailAddress());
		mimeMessageHelper.setSubject(subject);
		
		StringBuilder text = new StringBuilder();
		text.append("<html>");
		text.append("<body>");
		text.append("Hello ");
		text.append(client.getForeName());
		text.append(", <br><br>Your Calba <span>password</span> has been successfully reset.<br><br>");
		text.append("<h3>Account detail</h3>");	
		text.append("<table>");		
		text.append("<tr><td>Email: </td><td>" + email.getEmailAddress() + "</td></tr>");
		text.append("<tr><td>User Name: </td><td>" + client.getUserId() + "</td></tr>");
		text.append("<tr><td>Password: </td><td>" + client.getPassword() + "</td></tr>");
		text.append("</table>");	
		text.append("</body>");
		text.append("</html>");
		
		// Sets the text
		mimeMessageHelper.setText(text.toString(), true);

	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	

}
