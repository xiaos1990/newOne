package com.blusky.www.test;

public class TestReg {
	public static void main(String[] args) {
		String URI="/BluSky/images/assafs";
		System.out.println(URI.matches("^(/BluSky)((/image)|(/fonts)|(/files)|(/js)|(/css))/.*$"));
	}
}