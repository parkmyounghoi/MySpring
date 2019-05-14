package com.kbkb.mypackage.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sql;
	private int test;

	public int getTest() {
		return test;
	}

	public void setTest(int test) {
		this.test = test;
	}
	
	public void insert() {
		sql.insert("members.insert");
	}
	
}
