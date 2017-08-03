package com.AppErrorReport.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;

import com.AppErrorReport.model.App_Catalog;
import com.AppErrorReport.service.App_CatalogService;

@RestController
public class App_CatalogController {
	
	@Autowired
	private App_CatalogService appService;
	
	@RequestMapping(value="/ApplicationErrorReport/app_catalog/view.action", method = RequestMethod.POST)
	public @ResponseBody Map<String,? extends Object> view() throws Exception {
		
		try {
			
			List<App_Catalog> apps = appService.getApps();
			
			return getMap(apps);
			
		} catch (Exception e) {
			
			return getModelMapError("Error retrieving Apps from DB.");
		}
	}
	
	@RequestMapping(value = "/create.action", method = RequestMethod.POST)
	public Map<String,? extends Object> create(@RequestBody App_Catalog app) throws Exception {
		
		try {
			
			List<App_Catalog> apps = appService.addApp(app);
			return getMap(apps);
		} catch (Exception e) {
			
			return getModelMapError("Error trying to create app.");
		}
	}
	
	private Map<String, Object> getMap(List<App_Catalog> apps){
		
		Map<String, Object> modelMap = new HashMap<String, Object>(3);
		modelMap.put("total", apps.size());
		modelMap.put("data", apps);
		modelMap.put("success", true);
		
		return modelMap;
	}
	
	private Map<String, Object> getModelMapError(String msg) {
		
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("message", msg);
		modelMap.put("success", false);
		
		return modelMap;
	}
	
	@Autowired
	public void setAppService(App_CatalogService appService) {
		this.appService = appService;
	}
}
