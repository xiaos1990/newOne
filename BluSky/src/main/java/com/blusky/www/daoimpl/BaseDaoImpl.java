package com.blusky.www.daoimpl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;





import org.hibernate.transform.Transformers;

import com.blusky.www.Idao.BaseDaoI;

@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDaoI<T>{
	
	@Inject
	SessionFactory sFactory;
	
	private Class<T> clazz ;

	public BaseDaoImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}

	public void saveEntity(T t) {
		sFactory.getCurrentSession().save(t);
		
	}

	public void updateEntity(T t) {
		// TODO Auto-generated method stub
		
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
		return (T) sFactory.getCurrentSession().get(clazz, id);
	}

	public T loadEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		// TODO Auto-generated method stub
		List<T> list;
		try{
		Query query=sFactory.getCurrentSession().createQuery(hql);
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				query.setParameter(i, objects[i]);
			}			
		}
		list=query.list();
		}catch(Exception e){
			e.printStackTrace();
			list=null;
		}
		return list;
	}

	public Object uniqueResult(String hql, Object... objects) {
		// TODO Auto-generated method stub
		return null;
	}

	public List findListBySQL(String sql, Class classObject, Object... objects) {
		// TODO Auto-generated method stub
		List list;
		try{
		SQLQuery query=sFactory.getCurrentSession().createSQLQuery(sql);
		if(classObject==null)
			query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		else {
			query.addEntity(classObject);
		}
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				query.setParameter(i, objects[i]);
			}			
		}
		list=query.list();
		}catch(Exception e){
			e.printStackTrace();
			list=null;
		}
		return list;
	}

}
