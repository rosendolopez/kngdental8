package mx.com.kngdental.service;

import java.util.List;

import mx.com.kngdental.model.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
