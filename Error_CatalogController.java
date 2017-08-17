package com.AppErrorReport.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AppErrorReport.model.Error_Catalog;
import com.AppErrorReport.service.Error_CatalogService;

@Controller
public class Error_CatalogController {
	
	private Error_CatalogService errorService;
	
	@RequestMapping(value="/error_catalog/view.action")
	public @ResponseBody Map<String,? extends Object> view() throws Exception {
		
		try {
			List<Error_Catalog> errors = errorService.getErrorList();
			return getMap(errors);
			
		} catch (Exception e) {
			
			return getModelMapError("Error retrieving Errors from DB.");
		}
	}
	
	@RequestMapping(value="/error_catalog/create.action", method = RequestMethod.POST)
	public @ResponseBody Map<String,? extends Object> create(@RequestBody Object data) throws Exception {
		try {
			
			List<Error_Catalog> errors = errorService.addError(data);
			return getMap(errors);
			
		} catch (Exception e) {
			
			return getModelMapError("Fail trying to create error.");
		}
	}
	
	@RequestMapping(value = "/error_catalog/searchError.action")
	public @ResponseBody Map<String, ? extends Object> searchError(@RequestParam int idError) throws Exception {
		
		try {
			
			Error_Catalog error = errorService.getError(idError);
			return getMapforError(error);
		} catch(Exception e){
			
			return getModelMapError("Error retrieving Error from DB.");
		}
	}
	
	private Map<String, Object> getMapforError(Error_Catalog error) {
		
		Map<String, Object> modelMap =new HashMap<String, Object>(3);
		modelMap.put("total", 1);
		modelMap.put("data", error);
		modelMap.put("success", true);
		
		return modelMap;
	}
	
	private Map<String, Object> getMap(List<Error_Catalog> errors) {
		
		Map<String, Object> modelMap = new HashMap<String,Object>(3);
		modelMap.put("total", errors.size());
		modelMap.put("data", errors);
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
	public void setErrorService(Error_CatalogService errorService) {
		
		this.errorService = errorService;
	}	
}
