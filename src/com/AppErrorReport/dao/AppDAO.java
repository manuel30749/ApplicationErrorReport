package com.AppErrorReport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.AppErrorReport.model.App_Catalog;

public class AppDAO implements IAppDAO {
	
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	public void setHibernateTemplate(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@Override
	public App_Catalog addApp(App_Catalog app) {
		hibernateTemplate.saveOrUpdate(app);
		return app;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<App_Catalog> getApps() {		
		return hibernateTemplate.find("find app_catalog");
	}
}
