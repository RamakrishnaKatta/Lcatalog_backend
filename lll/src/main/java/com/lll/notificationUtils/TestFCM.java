package com.lll.notificationUtils;

public class TestFCM {

	public static void main(String[] args) {

		// Just I am passed dummy information

		String tokenId ="AAAAz9zKjQM:APA91bFZ8Zj2vql4HyV9gtLDEmj8YcGKrTfgTVyxQZ92wRMK7MIf184fjEAMI8obTfpXZlEf10njhGeO4Yepjwn60fa_nabqWTcA0BMNh6F36HdUbrcUn4FPgNRA0n8mYNVPAFY9nwNU";

		String server_key = "AAAAz9zKjQM:APA91bFZ8Zj2vql4HyV9gtLDEmj8YcGKrTfgTVyxQZ92wRMK7MIf184fjEAMI8obTfpXZlEf10njhGeO4Yepjwn60fa_nabqWTcA0BMNh6F36HdUbrcUn4FPgNRA0n8mYNVPAFY9nwNU";

		String title="haii";
		String message = "Welcome to FCM Server push notification!.";

		// Method to send Push Notification

		System.out.println(FCM.send_FCM_Notification(tokenId, server_key,title, message));

	}

}
