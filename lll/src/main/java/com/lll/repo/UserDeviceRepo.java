package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.UserDetail;
import com.lll.model.UserDevice;

public interface UserDeviceRepo extends JpaRepository<UserDevice, Integer>{
	
	UserDevice findByTokenId(String tokenId);

}
