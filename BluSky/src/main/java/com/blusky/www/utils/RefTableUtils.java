package com.blusky.www.utils;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;


public class RefTableUtils {


	public static List getListBySql(String domainCode){
		Session session = HibernateUtils.getSession();
		
		Query query ;
		String sql = "select ref_value,short_description from ref_table where domain_code=:domain_code order by sort_value";
		try{	
			query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			query.setParameter("domain_code",domainCode);
		
			return query.list();
		}catch(Exception e){
		
			e.printStackTrace();
			return null;
		}finally{
			session.close();
		}
	}
	
}
