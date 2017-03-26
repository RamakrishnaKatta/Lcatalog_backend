package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.VendorDetail;

public interface VendorRepo extends JpaRepository<VendorDetail, Integer> {

}
