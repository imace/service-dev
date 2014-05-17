package com.sonymobile.sonysales.servlet.Management;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sonymobile.sonysales.entity.AssociationOrders;

/**
 * @author 28852095
 * 
 */
public class LashouFileUpLoad extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // 设置编码
		// 获得磁盘文件条目工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 获取文件需要上传到的路径
		String path = request.getRealPath("/upload");
		String filename="";
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			// 可以上传多个文件
			List<FileItem> list = (List<FileItem>) upload.parseRequest(request);
			for (FileItem item : list) {
				// 获取表单的属性名字
				String name = item.getFieldName();
				// 如果获取的 表单信息是普通的 文本 信息
				if (item.isFormField()) {
					// 获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的
					String value = item.getString();
					request.setAttribute(name, value);
				}
				// 对传入的非 简单的字符串进行处理 ，比如说二进制的 图片，电影这些
				else {
					String value = item.getName();
					int start = value.lastIndexOf("\\");
					filename = value.substring(start + 1);
					filename = System.currentTimeMillis() + "-" + filename;
					request.setAttribute(name, filename);
					OutputStream out = new FileOutputStream(new File(path,
							filename));
					InputStream in = item.getInputStream();
					int length = 0;
					byte[] buf = new byte[1024];
					while ((length = in.read(buf)) != -1) {
						out.write(buf, 0, length);
					}
					in.close();
					out.close();
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//SonySalesExcelTools.importJDOrdersToDB(path+"\\"+filename);
		AssociationOrders assciationorders= SonySalesExcelTools.importAndVerifySupportedOrders(path+"\\"+filename);
		String downfile="VerifedResult";
		String fileFullPath = SonySalesExcelTools.exportUserHandleData(path, downfile, assciationorders);
		
		request.setAttribute("Order", assciationorders);
		request.setAttribute("DownFile", fileFullPath);
		request.getRequestDispatcher("/jsp/Management/VerifyOrder.jsp")
				.forward(request, response);
	}
}
