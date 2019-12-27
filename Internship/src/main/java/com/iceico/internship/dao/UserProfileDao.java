/**
 * 
 */
package com.iceico.internship.dao;

import java.util.List;

import com.iceico.internship.model.UserProfile;

/**
 * @author PRAFUL MESHRAM
 * @version 0.1
 *
 */
public interface UserProfileDao {
	List<UserProfile> findAll();

	UserProfile findByType(String type);

	UserProfile findById(int id);
}
