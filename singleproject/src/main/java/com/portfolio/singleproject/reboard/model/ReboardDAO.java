package com.portfolio.singleproject.reboard.model;

import java.util.List;

public interface ReboardDAO {

	int reboardWrite(ReboardVO reboardVo);
	List<ReboardVO> reboardSearch(ReboardVO reboardVo);
	int searchTotal(ReboardVO reboardVo);
	int readcountUp(int reNo);
	ReboardVO reboardSelByNo(int reboardNo);
	int reboardEdit(ReboardVO reboardVo);
}
