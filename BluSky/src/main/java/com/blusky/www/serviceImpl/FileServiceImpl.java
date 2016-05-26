package com.blusky.www.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.FileDaoI;
import com.blusky.www.Iservice.FileServiceI;
import com.blusky.www.bean.UploadFiles;

@Service("fileService")
@Transactional
public class FileServiceImpl extends BaseServciceImpl<UploadFiles> implements FileServiceI {
	
	@Resource
	FileDaoI fileDao;
	
	@Resource(name="fileDao")
	public void setDao(BaseDaoI<UploadFiles> dao) {
		super.setDao(dao);		
	};
	
	/*public void save(UploadFiles file) {
		// TODO Auto-generated method stub
		//System.out.println("Hello World");
		fileDao.save(file);
		
	}*/

}
