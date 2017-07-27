package com.AppErrorReport.dao;

import java.util.List;

import com.AppErrorReport.model.User_AppError;

public interface IUserAppError {
	User_AppError addLog(User_AppError log);
	List<User_AppError> getLogs();
	void clearLogs();
	void deleteLog(int id);
}
