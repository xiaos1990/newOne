package com.blusky.www.bean;

import java.util.Date;
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
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "USER_BEAN")
public class UserBean {
	@Id
	@SequenceGenerator(name="gen",sequenceName="USER_BEAN_ID_SEQ")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen")
	@Column(name="user_id")
	private int id;
	
	@NotEmpty(message="email is required!")
	@Email(message="email is not valid!")
	private String email;
	
	@Column(name="user_name")
	@NotEmpty(message="name is required!")
	private String name;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull(message="birthday is required!")
	@Past(message="birthday is not valid!")
	private Date birthday;
	
	@NotNull(message="phone is required!")
	@Pattern(regexp="^\\d{3}-\\d{3}-\\d{4}$",message="phone is not valid!")
	private String phone;
	
	@NotEmpty(message="password is required!")
	private String password;

	
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
	
	private String Country="US";
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<PropertyBean> properties;
	
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	
}
