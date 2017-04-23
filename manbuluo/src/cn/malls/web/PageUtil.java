package cn.malls.web;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class PageUtil {
	public static List<?> getList(Session session,String hql,int offset,int length, byte by){
		Query query = session.createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		query.setByte(0, by);
		List<?> list = query.list();
		return list;
		
	}
	
	
	public static List<?> getCartList(Session session,String hql,int offset,int length, int accountId){
		Query query = session.createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		query.setInteger(0, accountId);
		List<?> list = query.list();
		return list;
		
	}
	
}
