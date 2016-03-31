package com.blusky.www.daoimpl;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blusky.www.Idao.PropertyDaoI;
import com.blusky.www.Idao.UserDaoI;
import com.blusky.www.bean.PropertyBean;
import com.blusky.www.bean.UserBean;

@Repository("propertyDao")
public class PropertyDaoImpl extends BaseDaoImpl<PropertyBean> implements PropertyDaoI{

	
	@Inject
	SessionFactory sf;
	

	public void save(PropertyBean propertyBean) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(propertyBean);
	}

}
