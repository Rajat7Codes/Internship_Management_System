/**
 * 
 */
package com.iceico.internship.dao;

import java.util.List;

import com.iceico.internship.model.User;

/**
 * @author PRAFUL MESHRAM
 * @version 0.1
 *
 */
public interface UserDao {

	User findById(int id);

	User findBySSO(String sso);

	void save(User user);

	void deleteBySSO(String sso);

	List<User> findAllUsers();

}
