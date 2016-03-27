package com.blusky.www.Idao;

import com.blusky.www.bean.TestBean;
public interface TestDaoI extends BaseDaoI<TestBean>{
	void save(TestBean tb);
}
