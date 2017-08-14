package com.AppErrorReport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.AppErrorReport.dao.AppDAO;
import com.AppErrorReport.model.App_Catalog;
import com.AppErrorReport.util.Util;

@Service("app_CatalogService")
public class App_CatalogService {

	private AppDAO appDAO;
	private Util util;
	
	@Transactional
	public List<App_Catalog> addApp(Object data){
		
		List<App_Catalog> newApp = new ArrayList<App_Catalog>();
		List<App_Catalog> list = util.getAppsFromRequest(data);
		
		for (App_Catalog app : list) {
			newApp.add(appDAO.addApp(app));
		}
		
		return newApp;
	}
	
	@Transactional(readOnly=true)
	public App_Catalog getApp(int idApp){
		
		return appDAO.getApp(idApp);
	}
	
	@Transactional(readOnly=true)
	public List<App_Catalog> getApps(){
		
		return appDAO.getApps();
	}
	
	@Autowired
	public void setAppDAO(AppDAO appDAO) {
		this.appDAO = appDAO;
	}
	
	@Autowired
	public void setUtil(Util util) {
		this.util = util;
	}	
}
