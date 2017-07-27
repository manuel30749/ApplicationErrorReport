package com.AppErrorReport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
@Entity
@Table(name="APP_CATALOG")
public class App_Catalog {	
	
	private int idApp;
	private String App;	
		
	@Id
	@GeneratedValue
	@Column(name="IDAPP")
	public int getIdApp() {
		return idApp;
	}
	public void setIdApp(int idApp) {
		this.idApp = idApp;
	}
	
	@Column(name="APP", nullable=false)
	public String getApp() {
		return App;
	}
	public void setApp(String app) {
		App = app;
	}
	
	public App_Catalog() {
		
	}
	
	public App_Catalog(int idApp, String app) {
		setIdApp(idApp);
		setApp(app);
	}

}
