package com.blusky.www.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blusky.www.Iservice.FileServiceI;
import com.blusky.www.Iservice.PropertyServiceI;
import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.PropertyBean;
import com.blusky.www.bean.UploadFiles;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;
import com.blusky.www.formbean.PropertyForm;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/property")
public class PropertyAction {
	
	private static final Logger logger = Logger.getLogger(PropertyAction.class);
	@Inject
	PropertyServiceI propertyService;
	@Inject
	UserServiceI userService;
	@Inject
	FileServiceI fileService;
	
	@RequestMapping(value = "/upload", method = {RequestMethod.POST,RequestMethod.GET})	
	public String uploadProperty(@ModelAttribute(value="propertyBean") @Valid PropertyBean propertyBean,BindingResult result,@RequestParam MultipartFile[] btnFile,HttpServletRequest request, HttpServletResponse response)throws Exception {
		logger.info("uploadProperty method executed!");
		request.getSession().setAttribute("amenities", request.getParameterValues("amenities"));
		request.getSession().setAttribute("leaseDetails", request.getParameterValues("leaseDetails"));
		List<UploadFiles> set = new ArrayList<UploadFiles>();
		InputStream is = null;
		OutputStream os = null;
		request.setAttribute("btnFile", btnFile);
		String[] strings = request.getParameterValues("leaseDetails");
		String[] strings1 = request.getParameterValues("amenities");
		if(!"SELL".equals(propertyBean.getType())&&(strings==null||strings.length==0)){
			result.rejectValue("leaseDetails","Lease Details can not be empty!");
		}
		if(StringUtils.isNotBlank(propertyBean.getCommisionFee())&&!propertyBean.getCommisionFee().matches("^\\d*(.\\d*)?%?$")){
			result.rejectValue("commisionFee","commision fee is not valid!");
		}
		String fileName;
		String folderRoot = this.getClass().getResource("").toString();
		folderRoot = (folderRoot.split("target")[0] + "src/main/webapp/files").substring(6);
		for (int i = 0; i < btnFile.length; i++) {
			if (btnFile[i].getSize() > 0) {
				fileName = btnFile[i].getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf("."));
				if (!(ext.equalsIgnoreCase(".mp4")|| ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png"))) {
					result.rejectValue("files", "File size should not over 10Mb");
					break;
				}
				if ((long) btnFile[i].getSize() > 10 * 1024 * 1204) {
					result.rejectValue("files", "File size should not over 10Mb");
					break;
				}
			}
		}
		if (result.hasErrors()) {			
			return "uploadProperty";
		} else {
			try {
				for (int i = 0; i < btnFile.length; i++) {
					if (btnFile[i].getSize() > 0) {
						String subFolder = btnFile[i].hashCode() % 100 + "";
						String filePath = folderRoot + File.separator+ subFolder;
						File file = new File(filePath);
						if (!(file.exists())) {
							file.mkdirs();
						}
						is = btnFile[i].getInputStream();
						String subFileName = new Date().getTime() + "";
						String ext = btnFile[i].getOriginalFilename().substring(btnFile[i].getOriginalFilename().lastIndexOf("."));
						File realFile = new File(filePath + File.separator+ subFileName + "_" + i + ext);
						os = new FileOutputStream(realFile);
						byte[] buffer = new byte[1024 * 1024];
						while (-1 != is.read(buffer, 0, buffer.length)) {
							os.write(buffer);
						}
						UploadFiles files = new UploadFiles();
						files.setAddress("/BluSky/files/" + subFolder + "/"+ subFileName + "_" + i + ext);
						files.setProperty(propertyBean);
						files.setSize(btnFile[i].getSize());
						if(".mp4".equalsIgnoreCase(ext)){
							files.setFileType("video");
						}else{
							files.setFileType("photo");
						}
						set.add(files);
					}
				}
				propertyBean.setFiles(set);
				StringBuffer leaseDetails = new StringBuffer();
				StringBuffer amenities = new StringBuffer();
					if(strings!=null&&strings.length>0){
					for(int i=0;i<strings.length;i++){
						if(i==0){
							leaseDetails.append(strings[i]);
						}else{
							leaseDetails.append(","+strings[i]);
						}
					}
					}
					if(strings1!=null&&strings1.length>0){
					for(int i=0;i<strings1.length;i++){
						if(i==0){
							amenities.append(strings1[i]);
						}else{
							amenities.append(","+strings1[i]);
						}
					}
					}
				propertyBean.setAmenities(amenities.toString());
				UserBean userBean = new UserBean();
				Thread.currentThread().setContextClassLoader(userBean.getClass().getClassLoader());
				userBean=(UserBean) request.getSession().getAttribute(CommonConstant.SESSION_USER);
				propertyBean.setUser(userBean);
				propertyBean.setModifiedDate(new Date());
				propertyBean.setCreatedDate(new Date());
				if(!propertyBean.getType().equals("RENT")){
					propertyBean.setLeaseDetails(null);
				}else{
					propertyBean.setLeaseDetails(leaseDetails.toString());
				}
				propertyService.updateEntity(propertyBean);
				

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (os != null)
						os.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
				try {
					if (is != null)
						is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			return "redirect:/user/properties";
		}
	}

	@RequestMapping(value = "/display")
	public String dipslayProperty(ModelMap map) {
		PropertyForm pForm = new PropertyForm();
		pForm.setPropertyList(getPropertyList(null));
/*		pForm.setTypeList(RefTableUtils.getListBySql("PROPERTY_TYPE_BUYER"));
		pForm.setPropertyTypeList(RefTableUtils.getListBySql("PROPERTY"));*/
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

	@RequestMapping(value = "/create/{propertyType}", method = RequestMethod.GET)
	public String createNewProperty(@PathVariable String propertyType,ModelMap map,HttpServletRequest request) {
		PropertyBean property = new PropertyBean();
		map.addAttribute("propertyBean", property);
		if("1".equals(propertyType))
		return "uploadProperty";
		else 
		return "uploadPropertyOther";	
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProperty(HttpServletRequest request) {
		PropertyBean pb = (PropertyBean) request.getSession().getAttribute("currentProperty");
		int size = pb.getFiles().size();
		for(int i=0;i<size;i++){
			String position = "position_"+i;
			String key = request.getParameter(position);
			for(UploadFiles file:pb.getFiles()){
				if(file.getFile_id()==(Long.parseLong(key))){
					file.setSortValue(i);
					fileService.updateEntity(file);
				}
			}
		}
		
		return "redirect:/user/properties";
	}
	
	
	@RequestMapping(value = "/displayDetails/{propertyId}", method = RequestMethod.GET)
	public String createNewProperty(@PathVariable("propertyId") String id,HttpServletRequest request) {
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String lat1 = request.getParameter("lat1");
		String lng1 = request.getParameter("lng1");
		String lat2 = request.getParameter("lat2");
		String lng2 = request.getParameter("lng2");
		JsonConfig jc = new JsonConfig();
	    jc.setExcludes(new String[]{"property","properties","createdDate","modifiedDate","birthday"});
	    jc.setIgnoreDefaultExcludes(false);
	    jc.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		request.setAttribute("lat",lat);
		request.setAttribute("lng",lng);
		List<UserBean> list =userService.findEntityByHQL("select ub from UserBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? ", new Object[]{lat1,lat2,lng1,lng2});
		JSONArray jArray=JSONArray.fromObject(list,jc);
		request.setAttribute("users", jArray.toString());
		PropertyBean property=propertyService.getEntity(Integer.parseInt(id));
		request.setAttribute("propertyBean", property);
		return "displayPropertyDetails";
	}
	
	@RequestMapping(value = "/edit/{propertyId}", method = RequestMethod.GET)
	public String editProperty(@PathVariable("propertyId") String id,HttpServletRequest request,ModelMap map) {		
		PropertyBean property=propertyService.getEntity(Integer.parseInt(id));
		Object[] parameters ={Integer.parseInt(id),"photo"};
		List<PropertyBean> properties=propertyService.findEntityByHQL("select distinct prop from PropertyBean prop left join fetch prop.files file where prop.id=? and file.fileType=? order by prop.createdDate desc,file.sortValue asc", parameters);	
		map.addAttribute("propertyBean", properties.get(0));
		request.getSession().setAttribute("currentProperty", property);
		return "editProperty";
	}
	
	
	

	@RequestMapping(value = "/display1")
	public  @ResponseBody List<PropertyBean> dipslayProperty1(HttpServletRequest request) {
		 new JSONArray();
		String zipcode =request.getParameter("zipcode");
		//System.out.println(zipcode);
		List<PropertyBean> list = new ArrayList<PropertyBean>();
		if(StringUtils.isNotEmpty(zipcode)&&zipcode.matches("^\\d{5}$")){
		Object[] paremeters={zipcode};
		
		/*list=propertyService.findListBySQL("SELECT pb.property_id,PB.ADDRESS,PB.CITY,PB.STATES,PB.ZIPCODE,FILES.ADDRESS AS ADDRESS1  from Property_Bean pb INNER JOIN UPLOADFILES FILES ON FILES.PROPERTY_ID=PB.PROPERTY_ID where pb.zipCode=? and rownum<11  ",null, paremeters);
		}else{
			list=propertyService.findListBySQL("SELECT pb.property_id,PB.ADDRESS,PB.CITY,PB.STATES,PB.ZIPCODE,FILES.ADDRESS AS ADDRESS1 from Property_Bean pb INNER JOIN UPLOADFILES FILES ON FILES.PROPERTY_ID=PB.PROPERTY_ID where rownum<3  ", null,null);	
			
		}*/
		list=propertyService.findEntityByHQL("SELECT distinct pb from PropertyBean pb  inner JOIN fetch pb.files FILES inner join fetch pb.user u  where pb.zipCode=? and rownum<50  ", paremeters);
		}else{
		list=propertyService.findEntityByHQL("SELECT distinct pb from PropertyBean pb inner JOIN fetch pb.files FILES inner join fetch pb.user u  where  rownum<30", null);
			
		}
		  /* JsonConfig jc = new JsonConfig();
		    jc.setExcludes(new String[]{"property","properties","createdDate","modifiedDate","birthday"});
		    jc.setIgnoreDefaultExcludes(false);
		    jc.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

			try {
	
			    mapper.writeValue(out, list);
			    JSONObject json = new JSONObject();
			   
			    jArray=JSONArray.fromObject(list,jc);
			    json.put("jsonObject", jArray);
			    System.out.println(json.toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			return list;
	}
	
	

	@RequestMapping(value = "/display2")
	public String dipslayProperty2(HttpServletRequest request) {
		String zipcode =request.getParameter("zipcode");
		List<PropertyBean> list = new ArrayList<PropertyBean>();
		if(StringUtils.isNotEmpty(zipcode)&&zipcode.matches("^\\d{5}$")){
		Object[] paremeters={zipcode};
		
		/*list=propertyService.findListBySQL("SELECT pb.property_id,PB.ADDRESS,PB.CITY,PB.STATES,PB.ZIPCODE,FILES.ADDRESS AS ADDRESS1  from Property_Bean pb INNER JOIN UPLOADFILES FILES ON FILES.PROPERTY_ID=PB.PROPERTY_ID where pb.zipCode=? and rownum<11  ",null, paremeters);
		}else{
			list=propertyService.findListBySQL("SELECT pb.property_id,PB.ADDRESS,PB.CITY,PB.STATES,PB.ZIPCODE,FILES.ADDRESS AS ADDRESS1 from Property_Bean pb INNER JOIN UPLOADFILES FILES ON FILES.PROPERTY_ID=PB.PROPERTY_ID where rownum<3  ", null,null);	
			
		}*/
		list=propertyService.findEntityByHQL("SELECT distinct pb from PropertyBean pb  inner JOIN fetch pb.files FILES inner join fetch pb.user u  where pb.zipCode=? and rownum<50  ", paremeters);
		}else{
			list=propertyService.findEntityByHQL("SELECT distinct pb from PropertyBean pb inner JOIN fetch pb.files FILES inner join fetch pb.user u  where  rownum<30  ", null);
			
		}
		System.out.println(list.toString());
		request.setAttribute("list123", list);
		new ByteArrayOutputStream();
	    new ObjectMapper();
	    JsonConfig jc = new JsonConfig();
	    jc.setExcludes(new String[]{"property","properties","createdDate","modifiedDate","birthday"});
	/*    jc.setIgnoreDefaultExcludes(false);*/
	    jc.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

		try {
new JSONObject();
		    JSONArray jArray = new JSONArray();
		    jArray=JSONArray.fromObject(list,jc);
		    /*json.put("jsonObject", jArray);
		    System.out.println(json.toString());*/
			request.setAttribute("jsonObject", jArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "displayProperty";

	}
	
	
	@RequestMapping(value = "/display3")
	public String dipslayProperty3(HttpServletRequest request) {
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		request.setAttribute("lat",lat);
		request.setAttribute("lng",lng);
		return "displayProperty";	
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/display/{lat1}/{lng1}/{lat2}/{lng2}/")
	@ResponseBody 
	public Map dipslayProperty(@PathVariable String lat1,@PathVariable String lng1,@PathVariable String lat2,@PathVariable String lng2) {
		Map map = new HashMap();

		System.out.println(lat1+","+lng1+","+lat2+","+lng2);
		/*map.put("properties",propertyService.findEntityByHQL("select ub from PropertyBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? order by price", new Object[]{lat1,lng1,lat2,lng2}));
		map.put("users",userService.findEntityByHQL("select ub from UserBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? ", new Object[]{lat1,lng1,lat2,lng2}));	*/
		//map.put("properties",propertyService.findEntityByHQL("select ub from PropertyBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? order by price", new Object[]{lat1,lat2,lng1,lng2}));
		//map.put("users",userService.findEntityByHQL("select ub from UserBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? ", new Object[]{lat1,lat2,lng1,lng2}));	
		map.put("properties",propertyService.findEntityByHQL("SELECT distinct pb from PropertyBean pb inner JOIN fetch pb.files FILES inner join fetch pb.user u  where pb.lat <=? and pb.lat>=? and pb.lng>=? and pb.lng<=? order by pb.price", new Object[]{lat1,lat2,lng1,lng2}));
		map.put("users",userService.findEntityByHQL("select ub from UserBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? ", new Object[]{lat1,lat2,lng1,lng2}));
		
		return map;	
	}
	
	@RequestMapping(value = "/search",method={RequestMethod.POST,RequestMethod.GET})
	public String searchProperty(HttpServletRequest request) {
		request.setAttribute("stype",request.getParameter("type"));
		request.setAttribute("saddress",request.getParameter("address"));
		
		return "displayProperty";
	}
	
	/*
	@RequestMapping(value = "/search",method=RequestMethod.POST)
	public String searchProperty(HttpServletRequest request) {
		StringBuffer sBuffer = new StringBuffer();
		String lat1=request.getParameter("lat1");
		String lng1=request.getParameter("lng1");
		String lat2=request.getParameter("lat2");
		String lng2=request.getParameter("lng2");
		String centerLat=request.getParameter("centerLat");
		String centerLng=request.getParameter("centerLng");
		String rentPrice=request.getParameter("rentPrice");
		String buyPrice=request.getParameter("buyPrice");
		String type=request.getParameter("type");
		String propertyType=request.getParameter("propertyType");
		String bed=request.getParameter("bed");
		String bath=request.getParameter("bath");
		
		request.setAttribute("centerLat", centerLat);
		request.setAttribute("centerLng", centerLng);
		sBuffer.append("select distinct pb from PropertyBean pb inner join fetch pb.files file inner join fetch pb.user u  where 1=1 ");
		List parameters = new ArrayList();
		if(StringUtils.isNotBlank(lat1)){
			sBuffer.append(" pb.lat <=?");	
			parameters.add(lat1);
		}
		if(StringUtils.isNotBlank(lat2)){
			sBuffer.append(" pb.lat >=?");	
			parameters.add(lat2);
		}
		if(StringUtils.isNotBlank(lng1)){
			sBuffer.append(" pb.lng >=?");	
			parameters.add(lng1);
		}
		if(StringUtils.isNotBlank(lng2)){
			sBuffer.append(" pb.lng <=?");	
			parameters.add(lng2);
		}
		if(StringUtils.isNotBlank(rentPrice)){
			String[] prices = rentPrice.split(",");
			sBuffer.append(" pb.price >=?");	
			parameters.add(prices[0]);
			if(!prices[1].equals("5000")){
				sBuffer.append(" pb.price <=?");	
				parameters.add(prices[1]);
			}
		}
		
		if(StringUtils.isNotBlank(buyPrice)){
			String[] prices = buyPrice.split(",");
			sBuffer.append(" pb.price >=?");	
			parameters.add(prices[0]);
			if(!prices[1].equals("1000000")){
				sBuffer.append(" pb.price <=?");	
				parameters.add(prices[1]);
			}
		}
		
		if(StringUtils.isNotBlank(type)){
			sBuffer.append(" pb.type =?");	
			parameters.add(type);
		}
		
		
		if(StringUtils.isNotBlank(propertyType)){
			sBuffer.append(" pb.propertyType =?");	
			parameters.add(propertyType);
		}
		if(StringUtils.isNotBlank(bed)){
			sBuffer.append(" pb.bed >=?");	
			parameters.add(bed);
		}
		if(StringUtils.isNotBlank(bath)){
			sBuffer.append(" pb.bath >=?");	
			parameters.add(bath);
		}
		
		
		List list = propertyService.findEntityByHQL(sBuffer.toString(),parameters.toArray());
		//map.put("users",userService.findEntityByHQL("select ub from UserBean ub where ub.lat <=? and ub.lat>=? and ub.lng>=? and ub.lng<=? ", new Object[]{lat1,lat2,lng1,lng2}));
		request.setAttribute("list", list);
		return "displayProperty";	
	}*/
	
}
