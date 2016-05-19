package com.blusky.www.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;






@Entity
@Table(name="upload_files")
public class UploadFiles {
	@Id
	@SequenceGenerator(name="gen2",sequenceName="UPLOADFILES_ID_SEQ",allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen2")
	private long file_id;
	
	private String address;
	@Column(name="file_size")
	private long size;
	
	@JsonIgnore
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="property_id")
	private PropertyBean property;
	@Column(name="file_type")
	private String fileType;
	@Column(name="sort_value")
	private Long sortValue;
	
	
	
	public Long getSortValue() {
		return sortValue;
	}
	public void setSortValue(Long sortValue) {
		this.sortValue = sortValue;
	}
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
	
	
	public PropertyBean getProperty() {
		return property;
	}
	public void setProperty(PropertyBean property) {
		this.property = property;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
}
