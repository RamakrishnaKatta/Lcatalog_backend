package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.VendorDetail;

public interface VendorRepo extends JpaRepository<VendorDetail, Integer> {

	//@Query(value="SELECT `SOCIETY_ROLE_ID` FROM `society_user_roles` WHERE `SOCIETY_USER_ID`=?1", nativeQuery=true)
	//VendorDetail findByVendorId(Integer id);
	
}
