package com.lll.controller.app;

import javax.annotation.PostConstruct;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@Controller
@EnableAsync
@EnableScheduling
public class Schedular {
	
	
	//@PostConstruct
//	@Scheduled(fixedDelay=5000)
//	public void test(){
//		System.out.println("RUNNING");
//	}

}
