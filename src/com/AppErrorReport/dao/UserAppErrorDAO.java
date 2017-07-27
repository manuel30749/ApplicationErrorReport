package com.AppErrorReport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.AppErrorReport.model.User_AppError;

@Repository
public class UserAppErrorDAO implements IUserAppError {
	
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@Override
	public User_AppError addLog(User_AppError log) {
		hibernateTemplate.saveOrUpdate(log);
		return log;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User_AppError> getLogs() {
		return hibernateTemplate.find("select user_apperror");
	}

	@Override
	public void clearLogs() {
		//backlog		
	}

	@Override
	public void deleteLog(int id) {
		Object record = hibernateTemplate.load(User_AppError.class, id);
		hibernateTemplate.delete(record);		
	}

}
