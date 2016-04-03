package com.blusky.www.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blusky.www.Iservice.PropertySerivceI;
import com.blusky.www.bean.PropertyBean;
import com.blusky.www.bean.UploadFiles;
import com.blusky.www.formbean.PropertyForm;
import com.blusky.www.utils.RefTableUtils;

@Controller
@RequestMapping("/property")
public class PropertyAction {

	@Inject
	PropertySerivceI propertyService;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadProperty(
			@ModelAttribute(value = "propertyBean") @Valid PropertyBean propertyBean,
			BindingResult result, @RequestParam MultipartFile[] btnFile,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<UploadFiles> set = new ArrayList<UploadFiles>();
		InputStream is = null;
		OutputStream os = null;
		String fileName;
		String folderRoot = this.getClass().getResource("").toString();
		// C:\Users\User\git\newOne\BluSky\src\main\webapp\files
		folderRoot = (folderRoot.split("target")[0] + "src/main/webapp/files")
				.substring(6);
		for (int i = 0; i < btnFile.length; i++) {
			if (btnFile[i].getSize() > 0) {
				fileName = btnFile[i].getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf("."));
				if (!(ext.equalsIgnoreCase(".mp4")
						|| ext.equalsIgnoreCase(".jpg") || ext
							.equalsIgnoreCase(".png"))) {
					result.reject("FileName" + i,
							"File type should be in the list");
				}

				if ((long) btnFile[i].getSize() > 100 * 1024 * 1204) {
					result.reject("File" + i, "File size should not over 100Mb");
					continue;
				}
			}
		}

		if (result.hasErrors()) {
			return "uploadProperty";
		} else {
			try {
				for (int i = 0; i < btnFile.length; i++) {
					if (btnFile[i].getSize() > 0) {
						String subFolder = btnFile[i].hashCode() % 20 + "";
						String filePath = folderRoot + File.separator
								+ subFolder;
						File file = new File(filePath);
						if (!(file.exists())) {
							file.mkdirs();// 如果不存在该文件目录,则创建
						}
						is = btnFile[i].getInputStream();
						String subFileName = new Date().getTime() + "";
						String ext = btnFile[i].getOriginalFilename()
								.substring(
										btnFile[i].getOriginalFilename()
												.lastIndexOf("."));
						File realFile = new File(filePath + File.separator
								+ subFileName + "_" + i + ext);
						os = new FileOutputStream(realFile);

						byte[] buffer = new byte[1024 * 1024];

						while (-1 != is.read(buffer, 0, buffer.length)) {
							os.write(buffer);
						}
						UploadFiles files = new UploadFiles();
						files.setAddress("/BluSky/files/" + subFolder + "/"
								+ subFileName + "_" + i + ext);
						files.setPropery(propertyBean);
						files.setSize(btnFile[i].getSize());
						set.add(files);

					}
				}
				propertyBean.setFiles(set);
				propertyService.save(propertyBean);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (os != null)
						os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					if (is != null)
						is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			return "uploadProperty";
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/display")
	public String dipslayProperty(ModelMap map) {
		PropertyForm pForm = new PropertyForm();
		pForm.setPropertyList(getPropertyList(null));
		pForm.setTypeList(RefTableUtils.getListBySql("PROPERTY_TYPE_BUYER"));
		pForm.setPropertyTypeList(RefTableUtils.getListBySql("PROPERTY"));
		System.out.println(pForm.getPropertyTypeList().get(0).get("REF_VALUE"));
		map.addAttribute("propertyForm", pForm);
		return "displayProperty";

	}

	@RequestMapping(value = "/filter")
	public String filterProperty(
			@ModelAttribute(value = "propertyForm") PropertyBean pForm) {

		// getPropertyList(pForm));
		return "display";

	}

	public List<PropertyBean> getPropertyList(PropertyForm pForm) {
		try {
			if (pForm == null) {
				String hql = "from PropertyBean pb where rownum<21 order by pb.createdDate desc";
				List<PropertyBean> list = propertyService.findEntityByHQL(hql,null);
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/newOne", method = RequestMethod.GET)
	public String createNewProperty(ModelMap map) {
		PropertyBean property = new PropertyBean();
		map.addAttribute("propertyBean", property);
		// HibernateUtils.getListBySql(sql, clazz, objects);

		return "uploadProperty";
	}
	
	@RequestMapping(value = "/displayDetails/{propertyId}", method = RequestMethod.GET)
	public String createNewProperty(@PathVariable("propertyId") String id,HttpServletRequest request) {
		PropertyBean property=propertyService.getEntity(Integer.parseInt(id));
		request.setAttribute("propertyBean", property);
		return "displayPropertyDetails";
	}
	
}
