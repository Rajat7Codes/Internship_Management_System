/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.InternshipSession;

/**
 * @author Rajat
 *
 */
public interface InternshipSessionService {
	public void saveSession(InternshipSession session);
	public void deleteSession(Long sessionId);
	public List<InternshipSession> getSessionList();
	public InternshipSession getSessionById(Long sessionId) throws ResourceNotFoundException;
}
