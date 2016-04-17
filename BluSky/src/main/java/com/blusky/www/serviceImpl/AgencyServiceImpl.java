package com.blusky.www.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.AgencyDaoI;
import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Iservice.AgencyServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;

@Service("agencyService")
@Transactional
public class AgencyServiceImpl extends BaseServciceImpl<UserBean> implements AgencyServiceI {
	
	AgencyDaoI agencyDao;
	
	@Resource(name="agencyDao")
	public void setDao(BaseDaoI<UserBean> dao) {
		super.setDao(dao);	
		agencyDao=(AgencyDaoI) dao;
	}
	
	
	@Override
	public boolean validateAgency(String parameter1, String parameter2,HttpServletRequest request) {

		Object[] parameters ={parameter1};
		List<UserBean> list =findEntityByHQL("from UserBean ub where trim(ub.email)=?",parameters);
		if(list!=null&&list.size()>0){
			if(list.get(0).getPassword().trim().equals(parameter2)){
				request.getSession(false).setAttribute(CommonConstant.SESSION_USER, list.get(0));
				return true;
			}
		}
		return false;
	}
	

}
