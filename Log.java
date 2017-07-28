package com.AppErrorReport.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
@Entity
@Table(name="USER_APPERROR")
public class Log {
	
	private int idLog;
	private String username;	
	private Set<App_Catalog> app;
	private Set<Error_Catalog> error;
	private String timestamp;
	
	@Id
	@GeneratedValue
	@Column(name="IDLOG")
	public int getIdLog() {
		return idLog;
	}
	public void setIdLog(int idLog) {
		this.idLog = idLog;
	}
	
	@Column(name="USERNAME", nullable=false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="APP", nullable=false)
	@ManyToOne(cascade = CascadeType.ALL)	
	public Set<App_Catalog> getApp() {
		return app;
	}
	public void setApp(Set<App_Catalog> app) {
		this.app = app;
	}
	
	@Column(name="ERROR", nullable=false)
	@OneToMany(mappedBy="ERROR")
	public Set<Error_Catalog> getError() {
		return error;
	}
	public void setError(Set<Error_Catalog> error) {
		this.error = error;
	}	
	
	@Column(name="TIMESTAMP", nullable=false)
	public String getTimestamp() {
		
		return timestamp;
	}	
	public void setTimestamp(String timestamp) {
		
		this.timestamp = timestamp;
	}
	
	public Log() {
		
	}
	
	public Log(int idLog, String username, Set<App_Catalog> app, Set<Error_Catalog> error) {
		setIdLog(idLog);
		setUsername(username);
		setApp(app);
		setError(error);
	}
}
