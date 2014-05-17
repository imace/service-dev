package com.sonymobile.sonysales.servlet.Management;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.sonymobile.sonysales.entity.AssociationOrders;
import com.sonymobile.sonysales.entity.OrderInfo;
import com.sonymobile.sonysales.service.OrderHistoryService;
import com.sonymobile.sonysales.util.ResultMsg;

public final class SonySalesExcelTools {
	private static Logger logger = Logger.getLogger(SonySalesExcelTools.class);

	private static Workbook getExcelWorkbook(String filePath)
			throws IOException {
		Workbook wb = null;
		String fileType = filePath.substring(filePath.lastIndexOf(".") + 1);
		InputStream stream = new FileInputStream(filePath);
		if (fileType.equals("xls")) {
			wb = new HSSFWorkbook(stream);
		} else if (fileType.equals("xlsx")) {
			wb = new XSSFWorkbook(stream);
		} else {
			logger.fatal("您提交的excel格式不正确");
		}
		return wb;
	}

	/**
	 * JD 订单导入到有效订单
	 * 
	 * @param filePath
	 *            提交订单的文件路径
	 * 
	 * @return 导入数据库是否成功
	 * */
	public static boolean importJDOrdersToDB(String filePath) {
		try {
			Workbook wb = getExcelWorkbook(filePath);

			Sheet sheet = wb.getSheetAt(0);
			boolean isSuccess = false;
			for (Row row : sheet) {
				if (row.getRowNum() == 0)
					continue;
				row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
				String jdId = row.getCell(0).getStringCellValue();
				row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
				String orderId = row.getCell(1).getStringCellValue();
				Map<?, ?> result = OrderHistoryService.addValidOrderHistory(
						orderId, jdId);
				logger.info(result);
				String code = (String) result.get(ResultMsg.RESULT_CODE_KEY);
				logger.info("code = " + code);
				if (Integer.valueOf(code) == ResultMsg.RESULT_CODE_ERROR) {
					isSuccess = false;
					break;
				} else {
					isSuccess = true;
				}
			}
			return isSuccess;
		} catch (IOException e) {
			e.printStackTrace();
			logger.fatal("导入文件错误：\n" + e.toString());
			return false;
		}
	}

	/**
	 * 导入客服整理晒单整理excel结果对象
	 * 
	 * @param filePath
	 *            提交订单的文件路径
	 * 
	 * @return 晒单结果对象
	 * 
	 * */
	public static AssociationOrders importAndVerifySupportedOrders(String filePath) {
		AssociationOrders associationOrders = new AssociationOrders();
		try {
			Workbook wb = getExcelWorkbook(filePath);

			Sheet sheet = wb.getSheetAt(0);
			Iterator<Row> rowInterator = sheet.rowIterator();
			Row row = rowInterator.next(); // The excel head row
			row = rowInterator.next();     // The excel head row
			row = rowInterator.next();
			row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			String ownJdId = row.getCell(0).getStringCellValue();
			row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			String ownOrderId = row.getCell(0).getStringCellValue();

			OrderInfo ownerOrderInfo = new OrderInfo();
			ownerOrderInfo.setJdId(ownJdId);
			ownerOrderInfo.setOrderNum(ownOrderId);
			associationOrders.setOwnerOrder(ownerOrderInfo);

			List<OrderInfo> supporterList = new ArrayList<OrderInfo>();
			row = rowInterator.next(); // The excel head row
			row = rowInterator.next(); // The excel head row
			while (rowInterator.hasNext()) {
				OrderInfo orderInfo = new OrderInfo();
				row = rowInterator.next();
				row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
				String supJdId = row.getCell(0).getStringCellValue();
				orderInfo.setJdId(supJdId);
				row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
				String orderId = row.getCell(1).getStringCellValue();
				orderInfo.setOrderNum(orderId);
				supporterList.add(orderInfo);
			}
			associationOrders.setSupptorOrderList(supporterList);

			return OrderHistoryService.verifyAssociationOrders(associationOrders);
		} catch (IOException e) {
			e.printStackTrace();
			logger.fatal("导入文件错误：\n" + e.toString());
			return null;
		}

	}

	/**
	 * 导出晒单整理结果
	 * */
	public static void exportUserHandleData(String path, String sheetName,
			AssociationOrders orders) {
		// write the column metadata in excel
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet(sheetName);
		int rowNum = 0;

		sheet.addMergedRegion(new CellRangeAddress(0, // first row (0-based)
				0, // last row (0-based)
				0, // first column (0-based)
				3 // last column (0-based)
		));// 设置合并的区域(发起者订单)
		sheet.addMergedRegion(new CellRangeAddress(3, // first row (0-based)
				3, // last row (0-based)
				0, // first column (0-based)
				3 // last column (0-based)
		));// 设置合并的区域(支持者订单)
		rowNum = buildOwnerOfUserHandleData(wb, rowNum, sheet, orders);
		rowNum = buildSupporterOfUserHandleData(wb, rowNum, sheet, orders);

		try {
			sheetName = System.currentTimeMillis() + "-" + sheetName;
			File file = new File(path, sheetName);
			if (!file.exists()) {
				file.createNewFile();
			}
			OutputStream out = new FileOutputStream(file);
			wb.write(out);
			out.close();
		} catch (FileNotFoundException e) {
			logger.fatal("No file found : \n");
			e.printStackTrace();
		} catch (IOException e) {
			logger.fatal("File I/O exception : \n");
			e.printStackTrace();
		}
	}

	private static int buildOwnerOfUserHandleData(HSSFWorkbook wb, int rowNum,
			HSSFSheet sheet, AssociationOrders orders) {
		HSSFCellStyle style = wb.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		HSSFRow row = sheet.createRow(rowNum++);
		HSSFCell cell = row.getCell(0);
		cell.setCellValue("发起者订单：");
		cell.setCellStyle(style);

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFillBackgroundColor(IndexedColors.GREEN.getIndex());
		row = sheet.createRow(rowNum++);

		cell = row.getCell(0);
		cell.setCellValue("单号");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("京东号");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("微信昵称");
		cell.setCellStyle(style);

		cell = row.createCell(3);
		cell.setCellValue("有效支持者");
		cell.setCellStyle(style);

		OrderInfo owner = orders.getOwnerOrder();
		style.setFillBackgroundColor(IndexedColors.WHITE.getIndex());
		row = sheet.createRow(rowNum++);

		cell = row.getCell(0);
		cell.setCellValue(owner.getOrderNum());
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue(owner.getJdId());
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue(owner.getNickname());
		cell.setCellStyle(style);

		cell = row.createCell(3);
		cell.setCellValue(orders.getValidSupporterCount());
		cell.setCellStyle(style);

		return rowNum;
	}

	private static int buildSupporterOfUserHandleData(HSSFWorkbook wb,
			int rowNum, HSSFSheet sheet, AssociationOrders orders) {
		HSSFCellStyle style = wb.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		HSSFRow row = sheet.createRow(rowNum++);
		HSSFCell cell = row.getCell(0);
		cell.setCellValue("支持者订单：");
		cell.setCellStyle(style);

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFillBackgroundColor(IndexedColors.GREEN.getIndex());
		row = sheet.createRow(rowNum++);

		List<OrderInfo> supporterList = orders.getSupptorOrderList();

		// Set the excel head of sheet
		cell = row.createCell(0);
		cell.setCellValue("单号");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("京东号");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("微信昵称");
		cell.setCellStyle(style);

		cell = row.createCell(3);
		cell.setCellValue("验证结果");
		cell.setCellStyle(style);

		// fill in the score data in excel
		for (int i = 0; i < supporterList.size(); i++) {
			row = sheet.createRow(i + rowNum);
			OrderInfo supporter = supporterList.get(i);

			cell = row.getCell(0);
			cell.setCellValue(supporter.getOrderNum());
			cell.setCellStyle(style);

			cell = row.createCell(1);
			cell.setCellValue(supporter.getJdId());
			cell.setCellStyle(style);

			cell = row.createCell(2);
			cell.setCellValue(supporter.getNickname());
			cell.setCellStyle(style);

			cell = row.createCell(3);
			cell.setCellValue(supporter.getVerifyResult());
			cell.setCellStyle(style);
		}

		return rowNum;
	}
}
