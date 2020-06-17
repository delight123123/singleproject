package com.portfolio.singleproject.login.model;

import com.portfolio.singleproject.register.model.RegisterVO;

public interface LoginServices {
	
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	public static final int NONE_USERID=3; //해당 아이디 존재하지 않음
	
	int userLogin(String userid,String userpw);
	RegisterVO userInfoByuserid(String userid);
}
