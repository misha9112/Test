package com.inc.vo;

public class PhotoVo {
	private int id;
	private String u_id, content, uri, regdate;

	public PhotoVo() {
	}

	public PhotoVo(int id, String u_id, String content, String uri, String regdate) {
		this.u_id = u_id;
		this.id = id;
		this.content = content;
		this.uri = uri;
		this.regdate = regdate;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
