package com.blusky.www.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.blusky.www.utils.AddressUtils;

public class TestAddress {

	public static void main(String[] args) {
		try {
			TestAddress ta = new TestAddress();
			String filePath = ta.getClass().getResource("/US_STATES.json")
					.getPath();
			File file = new File(filePath);
			BufferedReader bf = new BufferedReader(new FileReader(file));

			List<Map> list = new ArrayList<Map>();
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
		} catch (Exception e) {
			return;
		}
	}
}
