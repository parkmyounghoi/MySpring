package com.kbkb.mypackage.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDAO mda;
	
	public int Test() {
		return mda.getTest();
	}
	
	public void doinsert() {
		mda.insert();
	}
	
}
