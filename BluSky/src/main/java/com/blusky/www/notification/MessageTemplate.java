package com.blusky.www.notification;

import java.io.Serializable;


public class MessageTemplate implements Serializable {
	
	
	public final String content="<html>"
			+ "<head></head>"
			+"<body><img src='/BluSky/files/6/1459913715303_0.jpg' /><body>"
			+ "</html>";
    private String company;
    private String model;
    private int price;

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String toString () {
        StringBuilder sb = new StringBuilder().append("Company: ").append(company)
                                  .append(", Model: ").append(model)
                                  .append(", Price: ").append(price);
        return sb.toString();
    }

}
