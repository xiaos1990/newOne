package com.blusky.www.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "blue_user")
public class UserBean{
	@Id
	@SequenceGenerator(name="gen1",sequenceName="USER_BEAN_ID_SEQ",allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen1")
	@Column(name="user_id")
	private int id;
	
	@NotEmpty(message="email is required!")
	@Email(message="email is not valid!")
	private String email;
	
	@Column(name="first_name")
	@NotEmpty(message="first name is required!")
	private String firstName;
	
	@Column(name="last_name")
	@NotEmpty(message="last name is required!")
	private String lastName;
	
	
	@NotNull(message="phone is required!")
	@Pattern(regexp="^\\d{10}$",message="phone is not valid!")
	private String phone;
	
	@NotEmpty(message="password is required!")
	@Pattern(regexp="^\\d{10,20}$",message="password is not valid!")
	private String password;

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JsonIgnore
	private Set<PropertyBean> properties;
	
	
/*	@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull(message="birthday is required!")
	@Past(message="birthday is not valid!")
	@JsonIgnore
	private Date birthday;

	
	private String Country="US";
	
	@NotEmpty(message="address is required!")
	private String address;
	
	@NotEmpty(message="city is required!")
	private String city;
	@NotEmpty(message="zipCode is required!")
	@Pattern(regexp="^\\d{5}$",message="zipCode is not valid!")
	private String zipCode;
	
	@Column(name="states")
	@NotEmpty(message="state is required!")
	private String state;
	
	
	private String lat;
	private String lng;*/


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<PropertyBean> getProperties() {
		return properties;
	}

	public void setProperties(Set<PropertyBean> properties) {
		this.properties = properties;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	
}
