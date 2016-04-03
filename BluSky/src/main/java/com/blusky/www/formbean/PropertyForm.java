package com.blusky.www.formbean;

import java.util.List;
import java.util.Map;

import com.blusky.www.bean.PropertyBean;

public class PropertyForm {
	
	
	private String propertyType;
	private String type;
	private String price;
	private String sortBy;
	private List<Map<Object,Object>> propertyTypeList;
	private List<Map<Object,Object>> typeList;
	private List<PropertyBean> propertyList;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public List<PropertyBean> getPropertyList() {
		return propertyList;
	}
	public void setPropertyList(List<PropertyBean> propertyList) {
		this.propertyList = propertyList;
	}
	public List<Map<Object, Object>> getPropertyTypeList() {
		return propertyTypeList;
	}
	public void setPropertyTypeList(List<Map<Object, Object>> propertyTypeList) {
		this.propertyTypeList = propertyTypeList;
	}
	public List<Map<Object, Object>> getTypeList() {
		return typeList;
	}
	public void setTypeList(List<Map<Object, Object>> typeList) {
		this.typeList = typeList;
	}

	

	
	
	
	
}
