package com.AppErrorReport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.AppErrorReport.dao.LogDAO;
import com.AppErrorReport.model.Log;
import com.AppErrorReport.util.Util;


@Service
public class LogService {
	
	private LogDAO log;
	private Util util;
	
	@Transactional
	public List<Log> addLog(Object data) {
		
		List<Log> logs = new ArrayList<Log>();
		return null;
	}
	
}
