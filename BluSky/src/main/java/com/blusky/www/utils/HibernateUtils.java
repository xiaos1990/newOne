package com.blusky.www.utils;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class HibernateUtils {

	@Inject
	static SessionFactory sf;
	
	@Transactional
	public static List getListBySql(String sql,Class clazz,Object[] objects){
		Query query ;
		try{
			if(clazz!=null){
			 query = sf.getCurrentSession().createSQLQuery(sql).addEntity(clazz);
			}else{
			 query = sf.getCurrentSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			}
			if(objects!=null && objects.length>0){
				for(int i=0;i<objects.length;i++){
					query.setParameter(i, objects[i]);
				}
			}
			return query.list();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
