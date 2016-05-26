package com.blusky.www.notification;

import java.util.Properties;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.mail.Authenticator;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.apache.activemq.command.ActiveMQObjectMessage;

/*@Repository("emailListener")*/
public class AMQEmailListener implements MessageListener {

 /*   @Autowired
    MailSender mailSender;*/

  /*  private static int counter;*/

  /*  @PostConstruct
    public void initCounter () {
        System.out.println("Transformer: counter initialized");
        counter=0;
    }*/

    public void onMessage(Message message1) {

        if (message1 instanceof ActiveMQObjectMessage)
        {
            try
            {
               /* System.out.println("Converting object to AMQMobile class for email.");*/
                MessageTemplate messageTemplate = (MessageTemplate) ((ActiveMQObjectMessage) message1).getObject();
             /*   System.out.println("OnMessage: Email Object received in Listener as " + messageTemplate);

                 call message sender to put message onto second queue 
                System.out.println("Sending mail for amqMobile " + messageTemplate);
*/				
              /*  <bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
        		<property name="host" value="smtp.gmail.com" />
        		<property name="port" value="587" />
        		<property name="username" value="shuaixiao1223@gmail.com" />
        		<property name="password" value="${email.pass}" />
        		<property name="javaMailProperties">
        			<props>
        				<prop key="mail.smtp.auth">true</prop>
        				<prop key="mail.smtp.starttls.enable">true</prop>
        				<prop key="mail.smtp.auth.ntlm.domain">DOMAIN</prop>
        			</props>
        		</property>
        	</bean>*/
                final String from ="shuaixiao1223@gmail.com";
                String smtpHost="smtp.gmail.com";
                String port="587";
                String subject="Test";
                Properties mailProps = new Properties();
                mailProps.put("mail.smtp.from", from);
                mailProps.put("mail.smtp.host", smtpHost);
                mailProps.put("mail.smtp.port", port);
                mailProps.put("mail.smtp.auth", true);
                mailProps.put("mail.smtp.starttls.enable", "true");
             /*   mailProps.put("mail.smtp.socketFactory.port", port);
                mailProps.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                mailProps.put("mail.smtp.socketFactory.fallback", "false");
                mailProps.put("mail.smtp.starttls.enable", "true");*/

                Session mailSession = Session.getDefaultInstance(mailProps, new Authenticator() {

                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, "Zxcasdqwe123!");
                    }

                });
             
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                String[] emails = {from};
                InternetAddress dests[] = new InternetAddress[emails.length];
                for (int i = 0; i < emails.length; i++) {
                    dests[i] = new InternetAddress(emails[i].trim().toLowerCase());
                }
                message.setRecipients(RecipientType.TO, dests);
                message.setSubject(subject, "UTF-8");
                Multipart mp = new MimeMultipart();
                //MimeBodyPart mbp = new MimeBodyPart();
                
                
                
                String cid = "123";
                
                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setText("<html><head>"
                  + "<title>This is not usually displayed</title>"
                  + "</head>\n"
                  + "<body><div><b>Hi there!</b></div>"
                  + "<div>Sending HTML in email is so <i>cool!</i> </div>\n"
                  + "<div>And here's an image: <img src=\"cid:"
                  + cid
                  + "\" /></div>\n" + "<div>I hope you like it!</div></body></html>", 
                  "utf-8", "html");
                mp.addBodyPart(textPart);
                
                
                //mbp.setContent(messageTemplate.content, "text/html;charset=utf-8");
                //mp.addBodyPart(mbp);
                
        		String folderRoot = this.getClass().getResource("").toString();
        		folderRoot = (folderRoot.split("target")[0] + "src/main/webapp/files").substring(6)+"/0/1459391728403_0.jpg";                              
                MimeBodyPart imagePart = new MimeBodyPart();
                imagePart.attachFile(folderRoot);
                imagePart.setContentID("<" + cid + ">");
                imagePart.setDisposition(MimeBodyPart.INLINE);
                mp.addBodyPart(imagePart);
                
                message.setContent(mp);
                message.setSentDate(new java.util.Date());

                Transport.send(message);
                
                
                
              /*  Properties props = new Properties(); 
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                Session session = Session.getDefaultInstance(props, null);  
                MimeMessage simpleMessage = new MimeMessage(session);
                
                Address fromAddress = new InternetAddress("shuaixiao1223@gmail.com");
                Address toAddress = new InternetAddress("shuaixiao1223@gmail.com");
                simpleMessage.setFrom(fromAddress);
                simpleMessage.setRecipient(RecipientType.TO, toAddress);
                
                simpleMessage.setSubject("Test");
                simpleMessage.setText(messageTemplate.content,"utf-8", "html");

                Transport.send(simpleMessage,"shuaixiao1223@gmail.com","Zxcasdqwe123!");*/
                
              /*  SimpleMailMessage msg = new SimpleMailMessage();
                msg.setTo("shuaixiao1223@gmail.com");

                msg.setFrom("shuaixiao1223@gmail.com");
                msg.setSubject("Test");
                msg.setSentDate(new Date());
                msg.setText(messageTemplate.content);*/

                //System.out.println("Waiting for 10 sec intentionally bf sending mail...");
                //Thread.sleep(10000);

                //mailSender.send(msg);

            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
