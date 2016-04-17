package com.blusky.www.Idao;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.bean.AgencyBean;
import com.blusky.www.bean.UserBean;

public interface AgencyDaoI extends BaseDaoI<UserBean> {
	UserBean getAgencyByAgencyName(String agencyName);
}
