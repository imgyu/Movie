package com.movie.cs.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	List<HashMap<String, Object>> sessionList  =  new ArrayList<>();
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		
		String msg  =  message.getPayload();
		JSONObject obj  =  jsonToObjectParser(msg);
		
		String no  =  (String) obj.get("chr_no");
		HashMap<String, Object> map  =  new HashMap<String, Object>();
		if(map.size() > 0) {
			for(int i =0; i < map.size(); i++ ) {
				String chr_no  =  (String) sessionList.get(i).get("chr_no");
				if(chr_no.equals(no)) {
					map  =  sessionList.get(i);
					break;
				}
			}
			
			for(String key : map.keySet()) {
				if(key.equals("chr_no")) {
				continue;
			}
			
			WebSocketSession ws  =  (WebSocketSession) map.get(key);
			if(ws != null) {
				try {
					ws.sendMessage(new TextMessage(obj.toJSONString()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		  }
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		boolean flag  =  false;
		String url  =  session.getUri().toString();
		String chr_no  =  url.split("/chat/")[1];
		int idx  =  sessionList.size();
		if(sessionList.size() > 0) {
			for(int i = 0; i < sessionList.size(); i++) {
				String no  =  (String) sessionList.get(i).get("chr_no");
				if(no.equals(chr_no)) {
					flag  =  true;
					idx   =  i;
					break;
				}
			}
		}
		
		if(flag) {
			HashMap<String, Object> map  =  sessionList.get(idx);
			map.put(session.getId(), session);
		} else {
			HashMap<String,Object> map  =  new HashMap<String, Object>();
			map.put("chr_no", chr_no);
			map.put(session.getId(), session);
			sessionList.add(map);
		}
		
		JSONObject obj  =  new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		if(sessionList.size() > 0) {
			for(int i = 0; i < sessionList.size(); i++) {
				sessionList.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser  =  new JSONParser();
		JSONObject obj     =  null;
		try {
			obj  =  (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}