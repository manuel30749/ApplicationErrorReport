package com.AppErrorReport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.AppErrorReport.dao.ErrorDAO;
import com.AppErrorReport.model.Error_Catalog;
import com.AppErrorReport.util.Util;

@Service
public class Error_CatalogService {
	
	private ErrorDAO errorDAO;
	private Util util;
	
	@Transactional
	public List<Error_Catalog> addError(Object data){
		
		List<Error_Catalog> newErrors = new ArrayList<Error_Catalog>();
		
		List<Error_Catalog> list = util.getErrorsFromRequest(data);
		
		for(Error_Catalog error : list) {
			newErrors.add(errorDAO.addError(error));
		}
		
		return newErrors;		
	}
	
	@Transactional(readOnly=true)
	public List<Error_Catalog> getErrorList(){
		
		return errorDAO.getErrors();
	}
	
	@Autowired
	public void setErrorDAO(ErrorDAO errorDAO) {
		this.errorDAO = errorDAO;
	}
	
	@Autowired
	public void setUtil(Util util) {
		this.util = util;
	}
}
