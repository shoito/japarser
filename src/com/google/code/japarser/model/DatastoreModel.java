package com.google.code.japarser.model;

import java.io.Serializable;

import com.google.appengine.api.datastore.Key;

public interface DatastoreModel extends Serializable {
	public void setKey(Key key);
	public Key getKey();
	public void setVersion(Long version);
	public Long getVersion();
}
