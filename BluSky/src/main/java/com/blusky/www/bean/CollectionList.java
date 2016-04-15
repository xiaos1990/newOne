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



@Entity
@Table(name="collection_list")
public class CollectionList {
	@Id
	@Column(name="collection_id")
	@SequenceGenerator(name="gen2",sequenceName="collection_list_ID_SEQ",allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="gen2")
	private long collectionId;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="property_id")
	private PropertyBean propery;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private UserBean user;
	public long getCollectionId() {
		return collectionId;
	}
	public void setCollectionId(long collectionId) {
		this.collectionId = collectionId;
	}
	public PropertyBean getPropery() {
		return propery;
	}
	public void setPropery(PropertyBean propery) {
		this.propery = propery;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	
	
}