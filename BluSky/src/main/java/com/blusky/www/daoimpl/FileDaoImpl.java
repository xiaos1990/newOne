package com.blusky.www.daoimpl;

import org.springframework.stereotype.Repository;

import com.blusky.www.Idao.FileDaoI;
import com.blusky.www.bean.UploadFiles;

@Repository("fileDao")
public class FileDaoImpl extends BaseDaoImpl<UploadFiles> implements FileDaoI{

	
/*	@Inject
	SessionFactory sf;
	

	public void save(UploadFiles file) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(file);
	}
	public void update(UploadFiles file) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().update(file);
	}
*/
}
