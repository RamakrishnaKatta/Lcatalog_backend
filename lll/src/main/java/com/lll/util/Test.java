package com.lll.util;

import java.io.File;
import java.util.Random;
import java.util.UUID;

public class Test {
	
	public static void main(String[] args) {
//		String s="asdasd/asdad/models/asdad.zip";
//		String name=s.split("models/")[1];
//		System.out.println(name.split("\\.")[0]);
		//System.out.println(10000 + new Random().nextInt(90000));
		//51c022dc-6031-4fa5-8680-411fbfc70af0
		System.out.println(UUID.randomUUID().toString().substring(0, 18));
	}

}
