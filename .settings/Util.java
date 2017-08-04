package com.AppErrorReport.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.AppErrorReport.model.App_Catalog;
//import com.AppErrorReport.model.Error_Catalog;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component
public class Util {
	
//	public List<Error_Catalog> getErrorsFromRequest(Object data){
//		List<Error_Catalog> list;
//		
//		if(data.toString().indexOf('[') > -1) {
//			list = getListErrorFromJSON(data);
//		} else {
//			Error_Catalog error = getErrorFromJSON(data);
//			
//			list = new ArrayList<Error_Catalog>();
//			list.add(error);
//		}
//		
//		return list;
//	}
	
	public List<App_Catalog> getAppsFromRequest(Object data){
		List<App_Catalog> list;
		
		if(data.toString().indexOf('[') > -1) {
			list = getListAppFromJSON(data);
		} else {
			App_Catalog app = getAppFromJSON(data);
			
			list = new ArrayList<App_Catalog>();
			list.add(app);
		}
		return list;
	}
	
	/*JSON to App_Catalog Object*/	
	private App_Catalog getAppFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		App_Catalog newApp = (App_Catalog) JSONObject.toBean(jsonObject, App_Catalog.class);
		return newApp;
	}
	
	/*JSON to list of App_Catalog object*/
	@SuppressWarnings("unchecked")
	private List<App_Catalog> getListAppFromJSON(Object data){
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<App_Catalog> newApps = (List<App_Catalog>) JSONArray.toCollection(jsonArray, App_Catalog.class);
		return newApps;
	}
	
	/*JSON to Error_Catalog object*/
//	private Error_Catalog getErrorFromJSON(Object data) {
//		JSONObject jsonObject = JSONObject.fromObject(data);
//		Error_Catalog newError = (Error_Catalog) JSONObject.toBean(jsonObject, Error_Catalog.class);
//		return newError;
//	}
	
	/*JSON to list of Error_Catalog object*/
//	@SuppressWarnings("unchecked")
//	private List<Error_Catalog> getListErrorFromJSON(Object data){
//		JSONArray jsonArray = JSONArray.fromObject(data);
//		List<Error_Catalog> newErrors = (List<Error_Catalog>) JSONArray.toCollection(jsonArray, Error_Catalog.class);
//		return newErrors;
//	}
}
