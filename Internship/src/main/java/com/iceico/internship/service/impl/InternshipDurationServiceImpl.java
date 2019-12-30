/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
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
	private InternshipDurationRepository internshipRepository;

	/**
	 * 
	 */
	public InternshipDurationServiceImpl() {

	}

	@Override
	public void saveInternshipDuration(InternshipDuration internshipDuration) {
		this.internshipRepository.save(internshipDuration);
	}

	@Override
	public void deleteInternshipDuration(Long id) {
		this.internshipRepository.deleteById(id);
	}

	@Override
	public List<InternshipDuration> getInternshipDurationList() {
		return this.internshipRepository.findAll();
	}

	@Override
	public InternshipDuration getInternshipDurationById(Long id) throws ResourceNotFoundException {
		return this.internshipRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + id));
	}
}
