package com.blusky.www.Idao;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.bean.PropertyBean;


public interface PropertyDaoI extends BaseDaoI<PropertyBean> {
	void save(PropertyBean pb);
}
