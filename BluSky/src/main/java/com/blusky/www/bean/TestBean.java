package com.blusky.www.bean;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="TEST_BEAN")
public class TestBean {
		@Id
		@GeneratedValue(generator = "paymentableGenerator")    
		@GenericGenerator(name = "paymentableGenerator", strategy = "increment")  
		private int id;						
	
		private String request;
		
		private String response;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getRequest() {
			return request;
		}

		public void setRequest(String request) {
			this.request = request;
		}

		public String getResponse() {
			return response;
		}

		public void setResponse(String response) {
			this.response = response;
		}

		


}
