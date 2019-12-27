/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.model.InternshipDuration;
import com.iceico.internship.repository.InternshipDurationRepository;
import com.iceico.internship.service.InternshipDurationService;

/**
 * @author Rajat
 *
 */

@Service
@Transactional
public class InternshipDurationServiceImpl implements InternshipDurationService {

	@Autowired
	InternshipDurationRepository internshipRepository;
	
	/**
	 * 
	 */
	public InternshipDurationServiceImpl() {

	}

	@Override
	public void saveInternshipDuration(InternshipDuration internshipDuration) {
		internshipRepository.save(internshipDuration);
	}

	@Override
	public void deleteInternshipDuration(Long id) {
		internshipRepository.deleteById(id);
	}

	@Override
	public List<InternshipDuration> getInternshipDurationList() {
		return internshipRepository.findAll();
	}

	@Override
	public InternshipDuration getInternshipDurationById(Long id) {
		return internshipRepository.findById(id).get();
	}
}
