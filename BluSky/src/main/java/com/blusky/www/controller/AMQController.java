package com.blusky.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blusky.www.notification.AMQMsgProducer;


@Controller
public class AMQController {

    @Autowired
    AMQMsgProducer amqMsgProducer;

    @RequestMapping (value = "/1", method = RequestMethod.GET)
    public void getForm(Model model) {
        System.out.println("AMQController: Adding amq mobile in a model");
        amqMsgProducer.produce();
        System.out.println("AMQController: Msg send");
    }
}
