package com.AppErrorReport.dao;

import java.util.List;

import com.AppErrorReport.model.Error_Catalog;

public interface IErrorDAO {	
	Error_Catalog addError(Error_Catalog error);
	List<Error_Catalog> getErrors();	
}
