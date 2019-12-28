/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iceico.internship.model.InternshipSession;
import com.iceico.internship.repository.SessionRepository;
import com.iceico.internship.service.InternshipSessionService;

/**
 * @author Rajat
 *
 */
@Service
@Transactional
public class InternshipSessionServiceImpl implements InternshipSessionService {

	@Autowired
	SessionRepository sessionRepository;
	
	/**
	 * 
	 */
	public InternshipSessionServiceImpl() {

	}

	@Override
	public void saveSession(InternshipSession session) {
		sessionRepository.save(session);
	}

	@Override
	public void deleteSession(Long sessionId) {
		sessionRepository.deleteById(sessionId);
	}

	@Override
	public List<InternshipSession> getSessionList() {
		return sessionRepository.findAll();
	}

	@Override
	public InternshipSession getSessionById(Long sessionId) {
		return sessionRepository.findById(sessionId).get();
	}

}
