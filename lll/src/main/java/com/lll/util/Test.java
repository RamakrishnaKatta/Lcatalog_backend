package com.lll.util;

import java.io.File;
import java.util.Random;

public class Test {
	
	public static void main(String[] args) {
		String s="asdasd/asdad/models/asdad.zip";
		String name=s.split("models/")[1];
		System.out.println(name.split("\\.")[0]);
		//System.out.println(10000 + new Random().nextInt(90000));
	}

}
