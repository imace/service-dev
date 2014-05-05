package com.sonymobile.sonyfifa.entity.json;

public final class SaeFetchUrlResult {
	private int httpCode;
	private int errNumber;
	private String errMsg;
	private String content;
	private String body;

	public int getHttpCode() {
		return httpCode;
	}

	public void setHttpCode(int httpCode) {
		this.httpCode = httpCode;
	}

	public int getErrNumber() {
		return errNumber;
	}

	public void setErrNumber(int errNumber) {
		this.errNumber = errNumber;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}


}
