/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iceico.internship.model.Session;
import com.iceico.internship.repository.SessionRepository;
import com.iceico.internship.service.SessionService;

/**
 * @author Rajat
 *
 */
@Service
@Transactional
public class SessionServiceImpl implements SessionService {

	@Autowired
	SessionRepository sessionRepository;
	
	/**
	 * 
	 */
	public SessionServiceImpl() {

	}

	@Override
	public void saveSession(Session session) {
		sessionRepository.save(session);
	}

	@Override
	public void deleteSession(Long id) {
		sessionRepository.deleteById(id);
	}

	@Override
	public List<Session> getSessionList() {
		return sessionRepository.findAll();
	}

	@Override
	public Session getSessionById(Long id) {
		return sessionRepository.findById(id).get();
	}

}
