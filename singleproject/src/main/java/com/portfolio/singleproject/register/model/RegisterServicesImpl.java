package com.portfolio.singleproject.register.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.singleproject.common.SHA256Util;

@Service
public class RegisterServicesImpl implements RegisterServices{

	@Autowired
	private RegisterDAO registerDao;

	@Override
	public int userIdChk(String userid) {
		return registerDao.userIdChk(userid);
	}

	@Override
	public int userRegister(RegisterVO registerVo) {
		
		registerVo.setPath("");
		String salt=SHA256Util.generateSalt();
		registerVo.setSalt(salt);
		String password=SHA256Util.getEncrypt(registerVo.getUserpw(), salt);
		
		registerVo.setUserpw(password);
		
		return registerDao.userRegister(registerVo);
	}
}
