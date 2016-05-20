/*package com.blusky.www.notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import javax.jms.JMSException;
import javax.jms.Queue;



@Service ("amqMsgSender")
public class AMQMsgSender {

    @Autowired
    private JmsTemplate jmsTemplate;

    @Autowired
    private Queue reqAmqEmailQueue;

    *//**
     * Sends message using JMS Template.
     *
     *
     * @param msg the msg
     * @throws JMSException the jMS exception
     *//*
    public void sendMessage(MessageTemplate msg) throws JMSException
    {
        System.out.println("About to put message on queue. Queue[" + reqAmqEmailQueue.toString() + "] Message[" + msg + "]");
        jmsTemplate.convertAndSend(reqAmqEmailQueue, msg);
    }

    *//**
     * Sets the jms template.
     *
     * @param template the jms template
     *//*
    public void setJmsTemplate(JmsTemplate template)
    {
        this.jmsTemplate = template;
    }

}
*/