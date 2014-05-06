package com.sonymobile.sonysales.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import com.sina.sae.fetchurl.BinaryData;
import com.sina.sae.fetchurl.SaeFetchurl;
import com.sonymobile.sonysales.entity.json.SaeFetchUrlResult;

public final class HttpConnetcion {
	private static final String GET = "GET";
	private static final String POST = "POST";

	/**
	 * Using the default java HttpURLConnection to in "GET"
	 * 
	 * @param host the request host
	 * @return the response string of GET request result.
	 * 
	 * */
	public static final String httpGetRequest(String host) throws IOException {
		URL getUrl = new URL(host);
		HttpURLConnection connection = (HttpURLConnection) getUrl
				.openConnection();
		connection.connect();

		int statusCode = connection.getResponseCode();
		String response = null;
		if (statusCode == HttpURLConnection.HTTP_OK) {
			InputStream is = connection.getInputStream();

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int i = -1;
			while ((i = is.read()) != -1) {
				baos.write(i);
			}
			connection.disconnect();
			baos.flush();
			baos.close();
			is.close();

			response = baos.toString();
		}

		return response;
	}

	/**
	 * Use the SAE Fetchurl to request the HTTP connection in GET method
	 * 
	 * @param host the request host 
	 * @return the response of SAE http result 
	 * */
	public static final SaeFetchUrlResult saeHttpGetRequest(String host) {
		SaeFetchurl fetchUrl = new SaeFetchurl();
		fetchUrl.setMethod(GET);
		fetchUrl.setAllowRedirect(true);

		SaeFetchUrlResult result = new SaeFetchUrlResult();
		result.setContent(fetchUrl.fetch(host));
		result.setHttpCode(fetchUrl.getHttpCode());
		result.setBody(fetchUrl.body());
		result.setErrNumber(fetchUrl.getErrno());
		result.setErrMsg(fetchUrl.getErrmsg());

		return result;
	}
	
	/**
	 * Use the Fetchurl to request the HTTP connection POST method
	 * 
	 * @param host the request host
	 * @param postData post submit data
	 * 
	 * @return the response of SAE http result
	 * */
	public static final SaeFetchUrlResult saeHttpPostRequest(String host, BinaryData postData) {
		SaeFetchurl fetchUrl = new SaeFetchurl();
		fetchUrl.setMethod(POST);		
		fetchUrl.setAllowRedirect(false);
		fetchUrl.setPostData(postData);
		
		SaeFetchUrlResult result = new SaeFetchUrlResult();
		result.setContent(fetchUrl.fetch(host));
		result.setHttpCode(fetchUrl.getHttpCode());
		result.setBody(fetchUrl.body());
		result.setErrNumber(fetchUrl.getErrno());
		result.setErrMsg(fetchUrl.getErrmsg());

		fetchUrl.clean();

		return result;
	}

}
