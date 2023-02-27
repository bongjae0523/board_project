package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String userpw_chk; //정보 수정할 때 비밀번호 수정을 위함
	private String username;
	private String useremail;
	private String phone;
	private boolean enabled;

	private Date regDate;
	
	private String auth; //등급

}
