package mx.com.kngdental.dao;

import java.util.List;

import mx.com.kngdental.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
