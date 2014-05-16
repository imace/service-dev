package com.sonymobile.sonysales.entity.json;

/**
 * The result of SAE Fetch URL
 * */
public final class SaeFetchUrlResult {
	// The HTTP status code of http connection
	private int httpCode;
	// The Error number of SAE fetch URL
	private int errNumber;
	// The Error message of SAE fetch URL
	private String errMsg;
	// The HTTP connection content of SAE fetch URL
	private String content;
	// The HTTP connection body of SAE fetch URL
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

	@Override
	public String toString() {
		return "httpCode = " + httpCode + ",errNumber : " + errNumber + ", errMsg = " + errMsg + ", content = " + content;
	}
}
