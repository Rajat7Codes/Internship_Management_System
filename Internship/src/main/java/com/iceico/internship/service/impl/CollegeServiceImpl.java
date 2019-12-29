/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.College;
import com.iceico.internship.repository.CollegeRepository;
import com.iceico.internship.service.CollegeService;

/**
 * @author iceico
 *
 */
@Service
@Transactional
public class CollegeServiceImpl implements CollegeService {

	/**
	 * 
	 */
	public CollegeServiceImpl() {

	}

	@Autowired
	private CollegeRepository collegeRepository;

	@Override
	public void saveCollege(College college) {
		this.collegeRepository.save(college);
	}

	@Override
	public void deleteCollege(Long id) {
		this.collegeRepository.deleteById(id);
	}

	@Override
	public List<College> getInternshipDurationList() {
		return this.collegeRepository.findAll();
	}

	@Override
	public College getCollegeById(Long id) throws ResourceNotFoundException {
		return this.collegeRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + id));
	}

}
