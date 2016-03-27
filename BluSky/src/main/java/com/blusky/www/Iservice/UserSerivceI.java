package com.blusky.www.Iservice;
import com.blusky.www.bean.UserBean;

public interface UserSerivceI extends BaseServiceI<UserBean>{

	void save(UserBean ub);
}
