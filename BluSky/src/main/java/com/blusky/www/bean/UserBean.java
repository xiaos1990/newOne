package com.blusky.www.bean;

import java.util.Date;
import java.util.List;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "blue_user")
public class UserBean{
	@Id
	@SequenceGenerator(name="gen1",sequenceName="USER_BEAN_ID_SEQ",allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen1")
	@Column(name="user_id")
	private Long id;
	
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

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="user")
	@JsonIgnore
	private List<PropertyBean> properties;
	
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull(message="birthday is required!")
	@Past(message="birthday is not valid!")
	@JsonIgnore
	private Date birthday;

	@Column(name="country")
	private String country="US";
	
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
	private String lng;

	@Column(name="user_status")
	private String userStatus;
	@Column(name="account_status")
	private String accountStatus;
	@Column(name="is_agent")
	private String isAgent;
	@Column(name="email_code")
	private String emailCode;
	@Column(name="phone_code")
	private String phoneCode;
	@Column(name="is_email_activated")
	private String isEmailActivated;
	@Column(name="is_phone_activated")
	private String isPhoneActivated;
	
	@Column(name="expecation_value")
	private String expectationValue;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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

	public List<PropertyBean> getProperties() {
		return properties;
	}

	public void setProperties(List<PropertyBean> properties) {
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

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

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getIsAgent() {
		return isAgent;
	}

	public void setIsAgent(String isAgent) {
		this.isAgent = isAgent;
	}

	public String getEmailCode() {
		return emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}

	public String getPhoneCode() {
		return phoneCode;
	}

	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode;
	}

	public String getIsEmailActivated() {
		return isEmailActivated;
	}

	public void setIsEmailActivated(String isEmailActivated) {
		this.isEmailActivated = isEmailActivated;
	}

	public String getIsPhoneActivated() {
		return isPhoneActivated;
	}

	public void setIsPhoneActivated(String isPhoneActivated) {
		this.isPhoneActivated = isPhoneActivated;
	}

	public String getExpectationValue() {
		return expectationValue;
	}

	public void setExpectationValue(String expectationValue) {
		this.expectationValue = expectationValue;
	}

	

	
}
