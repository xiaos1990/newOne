package com.blusky.www.utils;

import java.io.File;
import java.util.Map;
import org.codehaus.jackson.map.ObjectMapper;

public class AddressUtils {
	
	@SuppressWarnings("unchecked")
	public static Map<String, String> getUSStates() {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> map;

		try {
			String filePath = AddressUtils.class.getResource("/US_STATES.json").getPath();
			File file = new File(filePath);
			map = mapper.readValue(file, Map.class);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}