package com.portfolio.singleproject.login.model;

import com.portfolio.singleproject.register.model.RegisterVO;

public interface LoginDAO {
	
	String saltByuserid(String userid);
	RegisterVO userInfoByuserid(String userid);
}
