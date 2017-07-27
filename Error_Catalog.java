package com.AppErrorReport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
@Entity
@Table(name="ERROR_CATALOG")
public class Error_Catalog {
	
	private int idError;	
	private String description;
	
	@Id
	@GeneratedValue
	@Column(name="IDERROR")	
	public int getIdError() {
		return idError;
	}
	public void setIdError(int idError) {
		this.idError = idError;
	}
	
	@Column(name="DESCRIPTION", nullable=false)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Error_Catalog() {
		
	}
	
	public Error_Catalog(int idError, String description) {
		setIdError(idError);
		setDescription(description);
	}
}
