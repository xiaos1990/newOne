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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "Property_Bean")
public class PropertyBean {
	@Id
	@SequenceGenerator(name="gen",sequenceName="PROPERTY_BEAN_ID_SEQ",allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen")
	@Column(name="property_id")
	private int id;
	
	@NotEmpty(message="price is required!")
	private String price;
	@Min(message="beds is required!", value = 0)
	private String beds;
	@Min(message="baths is required!", value = 0)
	private String baths;
	
	@Column(name="property_size")
	@NotEmpty(message="size is required!")
	private String size;
	
	@Column
	@Pattern(regexp="^[12]$",message="unit is not valid!")
	private String unit;
	@NotEmpty(message="address is required!")
	private String address;
	@NotEmpty(message="city is required!")
	private String city;
	@Pattern(message="zipCode is required!", regexp = "^\\d{5}$")
	private String zipCode;
	
	@Column(name="states")
	@NotEmpty(message="state is required!")
	private String state;
	@NotEmpty(message="Country is required!")
	private String Country;
	@NotEmpty(message="propertyType is required!")
	private String propertyType;
	
	@Column(name="ptype")
	@NotEmpty(message="type is required!")
	private String type;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="property")
	private List<UploadFiles> files;
	
	@JsonIgnore
	private Date createdDate;
	@JsonIgnore
	private Date ModifiedDate;
	
	private String description;
	
	
	private String leaseDetails;
	
	private String amenities;
	
	private String lat;
	
	private String lng;
	
	private String quality;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private UserBean user;

	@Column(name="find_roommate")
	private String findRoommate;
	
	@Column(name="commision_fee")
	private String commisionFee;
	
	public String getFindRoommate() {
		return findRoommate;
	}

	public void setFindRoommate(String findRoommate) {
		this.findRoommate = findRoommate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}



	public List<UploadFiles> getFiles() {
		return files;
	}

	public void setFiles(List<UploadFiles> files) {
		this.files = files;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return ModifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLeaseDetails() {
		return leaseDetails;
	}

	public void setLeaseDetails(String leaseDetails) {
		this.leaseDetails = leaseDetails;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBeds() {
		return beds;
	}

	public void setBeds(String beds) {
		this.beds = beds;
	}

	public String getBaths() {
		return baths;
	}

	public void setBaths(String baths) {
		this.baths = baths;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
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

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getCommisionFee() {
		return commisionFee;
	}

	public void setCommisionFee(String commisionFee) {
		this.commisionFee = commisionFee;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
	
}
