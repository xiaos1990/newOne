/*package com.blusky.www.notification;

import javax.jms.Message;
import javax.jms.MessageListener;

import org.apache.activemq.command.ActiveMQObjectMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("messageListener")
public class AMQMessageListener implements MessageListener {

    @Autowired
    AMQMsgSender amqMsgSender;

    public void onMessage(Message message) {

        System.out.println("OnMessage: Listener working... " + message);
        System.out.println("OnMessage: message instance matched = " + (message instanceof ActiveMQObjectMessage));

        if (message instanceof ActiveMQObjectMessage)
        {
            try
            {
                System.out.println("Converting object to AMQMobile class.");
                MessageTemplate messageTemplate = (MessageTemplate) ((ActiveMQObjectMessage) message).getObject();
                System.out.println("OnMessage: Object received in Listener as " + messageTemplate);

                 call message sender to put message onto second queue 
                amqMsgSender.sendMessage(messageTemplate);

            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
*/