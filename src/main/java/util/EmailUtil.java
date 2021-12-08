package util;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
    public static void sendEmail(String recepient, String subject, String content) throws AddressException,
            MessagingException {

        System.out.println("Preparing to send email");


        // sets SMTP server properties;
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String email = "cnpmute@gmail.com";
        String password = "25fnxzgm";


        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });


        // creates a new e-mail message
        Message message = prepareMessage(session, email, recepient, subject, content);
        Transport.send(message);
        System.out.println("Message sent successfully");


    }

    private static Message prepareMessage(Session session, String email, String recepient, String subject, String content) {

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(subject);
            message.setText(content);
            return message;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
