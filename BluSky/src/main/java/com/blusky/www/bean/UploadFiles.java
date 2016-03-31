package com.blusky.www.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;


@Entity
public class UploadFiles {
	@Id
	@GenericGenerator(name="incre" , strategy="increment")
	@GeneratedValue(generator="incre")
	private long file_id;
	
	private String address;
	private long size;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="property_id")
	private PropertyBean propery;

	
	public long getFile_id() {
		return file_id;
	}
	public void setFile_id(long file_id) {
		this.file_id = file_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public PropertyBean getPropery() {
		return propery;
	}
	public void setPropery(PropertyBean propery) {
		this.propery = propery;
	}
}
