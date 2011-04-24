package com.google.code.japarser.controller;


public class HeartbeatController extends RestfulWebServiceController {

	@Override
	public void doGet() {
		responseWriter(SC_OK);
	}
}