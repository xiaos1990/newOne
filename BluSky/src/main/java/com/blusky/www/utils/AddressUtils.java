package com.blusky.www.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddressUtils {

	@SuppressWarnings("resource")
	public static List<Map<String, String>> getUSStates() {
		try {
			String filePath = AddressUtils.class.getResource("/US_STATES.json")
					.getPath();
			File file = new File(filePath);
			BufferedReader bf = new BufferedReader(new FileReader(file));
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			String line;
			while ((line = bf.readLine()) != null) {
				HashMap<String, String> result = new HashMap<String, String>();

				line = line.trim();
				if (!"{".equals(line.trim()) && !"}".equals(line.trim())) {
					line = line.replace("\"", "").replace(",", "");
					result.put("label", line.split(":")[0]);
					result.put("value", line.split(":")[1]);
					if (result.get("label") != null) {
						list.add(result);
					}
				}
			}
			return list;
		} catch (Exception e) {
			return null;
		}
	}
}
