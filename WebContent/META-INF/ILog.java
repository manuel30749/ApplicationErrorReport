package com.AppErrorReport.dao;

import java.util.List;

import com.AppErrorReport.model.Log;

public interface ILog {
	Log addLog(Log log);
	List<Log> getLogs();
	void clearLogs();
	void deleteLog(int id);
}
