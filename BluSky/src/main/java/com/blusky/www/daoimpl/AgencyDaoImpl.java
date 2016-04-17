package com.blusky.www.daoimpl;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blusky.www.Idao.AgencyDaoI;
import com.blusky.www.bean.AgencyBean;
import com.blusky.www.bean.UserBean;

@Repository("agencyDao")
public class AgencyDaoImpl extends BaseDaoImpl<UserBean> implements AgencyDaoI{

	
	@Inject
	SessionFactory sf;
	
	@Override
	public UserBean getAgencyByAgencyName(String agencyName) {
		return (UserBean) sf.getCurrentSession().createQuery("from UserBean ub where ub.email=?").setParameter(0, agencyName).list().get(0);
		
	}

}
