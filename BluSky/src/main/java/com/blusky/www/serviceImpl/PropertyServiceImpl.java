package com.blusky.www.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.PropertyDaoI;
import com.blusky.www.Iservice.PropertyServiceI;
import com.blusky.www.bean.PropertyBean;

@Service("propertyService")
@Transactional
public class PropertyServiceImpl extends BaseServciceImpl<PropertyBean> implements PropertyServiceI {
	
	@Resource
	PropertyDaoI propertyDao;
	
	@Resource(name="propertyDao")
	public void setDao(BaseDaoI<PropertyBean> dao) {
		super.setDao(dao);		
	};
	
/*	public void save(PropertyBean pb) {
		// TODO Auto-generated method stub
		System.out.println("Hello World");
		propertyDao.save(pb);
		
	}*/

}
