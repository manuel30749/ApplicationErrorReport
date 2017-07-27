package com.AppErrorReport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
@Entity
@Table(name="USER_APPERROR")
public class User_AppError {
	
	private int idUAE;
	private String username;
	private App_Catalog app;
	private Error_Catalog error;
	
	@Id
	@GeneratedValue
	@Column(name="IDUAE")
	public int getIdUAE() {
		return idUAE;
	}
	public void setIdUAE(int idUAE) {
		this.idUAE = idUAE;
	}
	
	@Column(name="USERNAME", nullable=false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="APP", nullable=false)
	public App_Catalog getApp() {
		return app;
	}
	public void setApp(App_Catalog app) {
		this.app = app;
	}
	
	@Column(name="ERROR", nullable=false)
	public Error_Catalog getError() {
		return error;
	}
	public void setError(Error_Catalog error) {
		this.error = error;
	}
	
	public User_AppError() {
		
	}
	
	public User_AppError(int idUAE, String username, App_Catalog app, Error_Catalog error) {
		setIdUAE(idUAE);
		setUsername(username);
		setApp(app);
		setError(error);
	}
}
