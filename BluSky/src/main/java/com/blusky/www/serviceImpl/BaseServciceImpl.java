package com.blusky.www.serviceImpl;


import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Iservice.BaseServiceI;

@Transactional
@Service("baseService")
public abstract class BaseServciceImpl<T> implements BaseServiceI<T>{

	BaseDaoI<T> dao;
	
	@Resource
	public void setDao(BaseDaoI<T> dao) {
		this.dao = dao;
	}

	
/*	private Class<T> clazz ;
	@SuppressWarnings("unchecked")
	public BaseServciceImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}
	*/

	public void saveEntity(T t) {
		// TODO Auto-generated method stub
		dao.saveEntity(t);
	}

	public void updateEntity(T t) {
		dao.updateEntity(t);
	}

	public void saveOrUpdateEntity(T t) {
		// TODO Auto-generated method stub
		
	}

	public void deleteEntity(T t) {
		// TODO Auto-generated method stub
		
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		// TODO Auto-generated method stub
		
	}

	public T getEntity(Integer id) {
		// TODO Auto-generated method stub
		return dao.getEntity(id);
	}

	public T loadEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		// TODO Auto-generated method stub
		
		return dao.findEntityByHQL(hql, objects);
	}

	public Object uniqueResult(String hql, Object... objects) {
		// TODO Auto-generated method stub
		return null;
	}

	public List findListBySQL(String sql, Class classObject, Object... objects) {
		// TODO Auto-generated method stub
		return dao.findListBySQL(sql, classObject, objects);
	}

}
