/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Session;

/**
 * @author Rajat
 *
 */
public interface SessionService {
	public void saveSession(Session session);
	public void deleteSession(Long id);
	public List<Session> getSessionList();
	public Session getSessionById(Long id) throws ResourceNotFoundException;
}
