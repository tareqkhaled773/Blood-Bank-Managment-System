package Beans;

import DAOs.BloodStockDAO;
import Entities.Request;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.AddressException;



public class BloodStockLogic {
    public boolean verifyBlood(Request req){
        Integer quantity= req.getQuantity();
        Integer location = req.getLocationfk();
        String bloodGroup = req.getBloodgroup();

        BloodStockDAO bdao= new BloodStockDAO();
       if(bdao.checkBlood(quantity,bloodGroup,location)){
           //Remove Blood from db
           return true;


       }
       else {
           return false;
       }



    }
    private static void mail(String email){
        Properties props = new Properties();
        String username = "malicksow19.ms19@gmail.com";
        String password = "72828282";
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("malicksow19.ms19@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("A testing mail header !!!");
            message.setText("Dear Mail Crawler,"
                    + "\n\n No spam to my email, please!");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }


    private static void sendFromGMail(String to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        String from = "malicksow19.ms19@gmail.com";
        String pass = "72828282";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress toAddress = new InternetAddress();

            toAddress = new InternetAddress(to);
            message.addRecipient(Message.RecipientType.TO, toAddress);

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
