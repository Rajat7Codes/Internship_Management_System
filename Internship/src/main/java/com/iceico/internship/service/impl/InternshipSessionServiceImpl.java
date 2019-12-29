/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iceico.internship.model.InternshipSession;
import com.iceico.internship.repository.InternshipSessionRepository;
import com.iceico.internship.service.InternshipSessionService;

/**
 * @author Rajat
 *
 */
@Service
@Transactional
public class InternshipSessionServiceImpl implements InternshipSessionService {

	@Autowired
	private InternshipSessionRepository internshipSessionRepository;

	/**
	 * 
	 */
	public InternshipSessionServiceImpl() {

	}

	@Override
	public void saveSession(InternshipSession session) {
		this.internshipSessionRepository.save(session);
	}

	@Override
	public void deleteSession(Long sessionId) {
		this.internshipSessionRepository.deleteById(sessionId);
	}

	@Override
	public List<InternshipSession> getSessionList() {
		return this.internshipSessionRepository.findAll();
	}

	@Override
	public InternshipSession getSessionById(Long sessionId) {
		return this.internshipSessionRepository.findById(sessionId).get();
	}

}
