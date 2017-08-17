package com.AppErrorReport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.AppErrorReport.model.Error_Catalog;

@Repository
public class ErrorDAO implements IErrorDAO {
	
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@Override
	public Error_Catalog addError(Error_Catalog error) {
		hibernateTemplate.saveOrUpdate(error);	
		return error;		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Error_Catalog> getErrors() {		
		return hibernateTemplate.find("from Error_Catalog");
	}	
	
	@Override
	public Error_Catalog getError(int idError) {
		
		return (Error_Catalog) hibernateTemplate.get(Error_Catalog.class, idError);
	}
}
