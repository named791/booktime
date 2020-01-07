package com.ez.booktime.api;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ImPortAPI {
	private static final String SEARCH_URL = "https://api.iamport.kr/users/getToken";
	private static final String IMP_KEY = "7567787049214999";
	private static final String IMP_SECRET = "ZbE8WQoHo0qaSbeharqCqlzi2FSaeMgeXUmULKCaL2kDeyVp0l1rHAJJgCTuoaIm45gQQT0BWlfaUbzV";
	private String access_token;
	
	@Autowired
	private Utility util;
	
	public ImPortAPI() {
		try {
			this.access_token = getAccess_Tokken();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}


	public String getAccess_Tokken() throws Exception {
		URL url = new URL(SEARCH_URL);
		
		Map<String, String> keyMap = new HashMap<String, String>();
		keyMap.put("imp_key", IMP_KEY);
		keyMap.put("imp_secret", IMP_SECRET);
		
		JSONObject obj = (JSONObject)util.getJson(url, "post", keyMap).get("response");
		return (String) obj.get("access_token");
	}
	
}
