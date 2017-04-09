package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.lll.model.UserDetail;

public interface UserRepo extends JpaRepository<UserDetail, Integer>{
	
	UserDetail findByVendorIdAndType(int vendorId,String type);
	
	UserDetail findByVendorId(Integer vendorId);
	
	@Query(value="SELECT * FROM `user_details` WHERE `vendor_id`=?1 ORDER BY `id` DESC LIMIT 0,1", nativeQuery=true)
	UserDetail getUserBySeqNo(Integer vendorId);
	
	@Query(value="SELECT * FROM `user_details` WHERE `mobile_no`=?1 and `password`=?2", nativeQuery=true)
	UserDetail checkLogin(String mobileNo,String password);
	
}
