package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.UserDetail;

public interface UserRepo extends JpaRepository<UserDetail, Integer>{

}
