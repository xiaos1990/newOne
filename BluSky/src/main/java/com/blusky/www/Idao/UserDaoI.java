package com.blusky.www.Idao;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.bean.UserBean;

public interface UserDaoI extends BaseDaoI<UserBean> {
	UserBean getUserByUserName(String userName);
}
