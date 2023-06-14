package com.websocket.controller;

import javax.websocket.EncodeException;
import javax.websocket.Encoder.Text;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

public class JsonEncoder implements Text<Message> {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig config) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(Message object) throws EncodeException {
		// TODO Auto-generated method stub
		return new Gson().toJson(object);
	}

	

}
