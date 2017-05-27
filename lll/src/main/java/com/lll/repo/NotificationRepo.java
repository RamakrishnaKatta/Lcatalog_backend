package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.Notification;

public interface NotificationRepo extends JpaRepository<Notification, Integer>{

}
