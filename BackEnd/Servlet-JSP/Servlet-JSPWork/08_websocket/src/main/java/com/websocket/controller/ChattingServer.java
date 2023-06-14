package com.websocket.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;


@ServerEndpoint(value="/chatting",
		decoders= {JsonDecoder.class},//json형식의 데이터를 자바 클래스로 변경
		encoders= {JsonEncoder.class}//자바클래스를 json형식을 변경
)
public class ChattingServer {
	//private Set<Session> clients=new ArrayList();
	
	@OnOpen
	public void open(Session session,EndpointConfig config) {
		//클라이언트가 접속요청을 하면 실행되는 메소드
		System.out.println(session.getId());
		System.out.println("서버접속!");
		//clients.add(session);
	}
	@OnMessage
//	//public void message(Session session,String msg)
	public void message(Session session,Message m){
		
		//js에서 socket.send("메세지")함수를 실행했을때
		//실행되는 메소드
		//send()함수의 인자값이 두번째 매개변수에 저장이 된다.
		//클라이언트가 보낸데이터가 두번째 매개변수에 저장된다.
		System.out.println(m);
//		Message m=new Gson().fromJson(msg,Message.class);
		
		System.out.println(m);
		switch(m.getType()) {
			case "접속" : addClient(session,m);break;
			case "채팅" : sendMessage(session,m);break;
		}
		
//		//접속한 session을 가져올 수 있는 메소드제공
//		Set<Session> clients=session.getOpenSessions();
//		System.out.println(clients.size());
//		//session에 대한 구분자 값을 저장하기
//		session.getUserProperties().put("msg",msg);
//		
//		try {
//			for(Session client : clients) {
//				
//			//접속한 사용자에게 받은메세지를 전달
//				//session.getBasicRemote().sendText(msg);
//				client.getBasicRemote().sendText(msg);
//			}
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
	}
	
	private void addClient(Session session, Message msg) {
		//session을 구분할 수 있는 데이터를 저장하기
		session.getUserProperties().put("msg", msg);
		sendMessage(session,Message.builder()
				.type("알람")
				.msg(msg.getSender()+"님이 접속하셨습니다")
				.build());
	}
	private  void sendMessage(Session session,Message msg) {
		//접속한 클라이언트에게 메세지를 전송해주는 기능
		Set<Session> clients=session.getOpenSessions();
		try {
			if(msg.getReceiver()==null||msg.getReceiver().isBlank()) {
				//전체접속자에게 전송
				for(Session client:clients) {
					client.getBasicRemote()
					//.sendText(new Gson().toJson(msg));
					.sendObject(msg);
				}
			}else {
				//받는사람에게만 전송
				for(Session client:clients) {
					Message c=(Message)client.getUserProperties().get("msg");
					if(c.getSender().equals(msg.getReceiver())) {
						client.getBasicRemote()
						//.sendText(new Gson().toJson(msg));
						.sendObject(msg);
					}
					
				}
			}
		}catch(IOException |EncodeException e) {
			e.printStackTrace();
		}
	}
}





