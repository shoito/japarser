package com.google.code.japarser.model;

import java.util.Date;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.Model;

import com.google.appengine.api.datastore.Key;

@Model(kind = "AccessInfo", schemaVersion = 1)
public class AccessInfo implements DatastoreModel {
	private static final long serialVersionUID = 1L;
	
	@Attribute(primaryKey = true)
	private Key key;

	@Attribute(version = true)
	private Long version;
	
	private Date firstAccess;
	
	private Date lastAccess;
	
	private Long viewCount;

	@Override
	public void setKey(Key key) {
		this.key = key;
	}

	@Override
	public Key getKey() {
		return key;
	}

	@Override
	public void setVersion(Long version) {
		this.version = version;
	}

	@Override
	public Long getVersion() {
		return version;
	}

	public void setFirstAccess(Date firstAccess) {
		this.firstAccess = firstAccess;
	}

	public Date getFirstAccess() {
		return firstAccess;
	}

	public void setLastAccess(Date lastAccess) {
		this.lastAccess = lastAccess;
	}

	public Date getLastAccess() {
		return lastAccess;
	}

	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}

	public Long getViewCount() {
		return viewCount;
	}
}
