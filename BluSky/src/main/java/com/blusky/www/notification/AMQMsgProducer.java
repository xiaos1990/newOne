/*package com.blusky.www.notification;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;


@Service("amqMsgProducer")
public class AMQMsgProducer {

    @Autowired
    JmsTemplate jmsTemplate;

    public void produce() {

        jmsTemplate.send(new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {

            	MessageTemplate messageTemplate = new MessageTemplate();
            	messageTemplate.setCompany("newCompany");
            	messageTemplate.setModel("iPhone5");
            	messageTemplate.setPrice(45000);

                ObjectMessage message = session.createObjectMessage(messageTemplate);

                System.out.println("Sending on ["+jmsTemplate.getDefaultDestination()+"] object as " + messageTemplate);

                return message;
            }
        });
    }
}
*/