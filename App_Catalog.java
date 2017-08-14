package com.AppErrorReport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
@Entity
@Table(name="app_catalog")
public class App_Catalog {	
	
	private int idApp;
	private String app;
	private boolean status;
		
	@Id
	@GeneratedValue
	@Column(name="idApp")
	public int getIdApp() {
		return idApp;
	}
	public void setIdApp(int idApp) {
		this.idApp = idApp;
	}
	
	@Column(name="app", nullable=false)
	public String getApp() {
		return app;
	}
	public void setApp(String app) {
		this.app = app;
	}
	
	@Column(name="status", nullable=false)
	public boolean isStatus() {
		
		return status;
	}	
	public void setStatus(boolean status) {
		
		this.status = status;
	}
	
	public App_Catalog() {
		
	}
	
	public App_Catalog(int idApp, String app, boolean status) {
		setIdApp(idApp);
		setApp(app);
		setStatus(status);
	}
}
