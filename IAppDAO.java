package com.AppErrorReport.dao;

import java.util.List;

import com.AppErrorReport.model.App_Catalog;

public interface IAppDAO {
	App_Catalog addApp(App_Catalog app);
	List<App_Catalog> getApps();
	App_Catalog getApp(int id);
}
