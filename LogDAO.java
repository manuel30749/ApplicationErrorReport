package com.AppErrorReport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.AppErrorReport.model.Log;

@Repository
public class LogDAO implements ILog {
	
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@Override
	public Log addLog(Log log) {
		hibernateTemplate.saveOrUpdate(log);
		return log;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Log> getLogs() {
		return hibernateTemplate.find("select user_apperror");
	}

	@Override
	public void clearLogs() {
		//backlog		
	}

	@Override
	public void deleteLog(int id) {
		Object record = hibernateTemplate.load(Log.class, id);
		hibernateTemplate.delete(record);		
	}

}
