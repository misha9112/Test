package com.inc.util;

import java.util.regex.Pattern;

public class Verifier {
	public static boolean idVerify(String id) {
		//자바에서는 ()안에 정규표현식을 작성한다.
		String policy = "([A-Za-z0-9]{5,30})";
		
		//Pattern pattern = Pattern.compile(policy);
		//Matcher matcher = pattern.matcher(id);
		//return matcher.matches();
		
		return Pattern.compile(policy).matcher(id).matches();
	}
	
	public static boolean passwordVerify(String password) {
		String policy = 
				"((?=.*[!@#$%^*+=-_])(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z]).{8,30})";
		return Pattern.compile(policy).matcher(password).matches();
	}
	
	public static boolean nameVerify(String name) {
		String policy = "([가-힣]{2,10})";
		return Pattern.compile(policy).matcher(name).matches();
	}
	
}
