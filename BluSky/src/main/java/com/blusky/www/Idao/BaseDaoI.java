package com.blusky.www.Idao;

import java.util.List;

public interface BaseDaoI<T> {

	public void saveEntity(T t);
	public void updateEntity(T t);
	public void saveOrUpdateEntity(T t);
	public void deleteEntity(T t);
	public void batchEntityByHQL(String hql,Object...objects);
	public T getEntity(Integer id);
	public T loadEntity(Integer id);
	public List<T> findEntityByHQL(String hql,Object...objects);
	public Object uniqueResult(String hql,Object...objects);
	public List findListBySQL(String sql,Object classObject,Object...objects);	
}

