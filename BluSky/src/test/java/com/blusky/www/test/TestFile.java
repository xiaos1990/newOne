package com.blusky.www.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class TestFile {
	public static void main(String[] args) {
		TestFile tf =new TestFile();
		String folderRoot = tf.getClass().getResource("").toString();
		folderRoot = (folderRoot.split("target")[0] + "src/main/webapp/files").substring(6);
		File file =new File(folderRoot+"/0/1459391728403_0.jpg");
		try {
			FileInputStream inputStream =new FileInputStream(file);
			System.out.println(inputStream);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
