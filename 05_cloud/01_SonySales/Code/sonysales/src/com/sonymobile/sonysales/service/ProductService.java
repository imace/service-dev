package com.sonymobile.sonysales.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sonymobile.sonysales.dao.ProductDAO;

public class ProductService {

	// get product info
	public static List<?> getProduct() {

		List<?> list = ProductDAO.getProductList();

		return list;
	}
}
