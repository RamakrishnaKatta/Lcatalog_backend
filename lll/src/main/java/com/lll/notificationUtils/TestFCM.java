package com.lll.notificationUtils;

public class TestFCM {

	public static void main(String[] args) {

		// Just I am passed dummy information

		String tokenId ="eKKPoRYaB1c:APA91bGZJRh-_7g8L1dycf0SnGGDmOfS4Kof2PKQnKMa6R7Ba070rB7O-emWEIasO6clugnsfVUF5c-Iz8bMr5PDiPUUMYfjZB4BpNPCrsahjSHP_qTNSXcC6PvwdQsSDjKui6ygduNt";

		String server_key = "AIzaSyCKqBOyMOIx7h3xDvF0lZVpchB73feik_g";

		String title="haii";
		String message = "Welcome to FCM Server push notification!.";

		// Method to send Push Notification

		System.out.println(FCM.send_FCM_Notification(tokenId, server_key,title, message));

	}

}
