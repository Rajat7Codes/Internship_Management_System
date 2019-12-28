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
 * @author Puja
 * @version 0.1
 * Creation Date: 27/12/2019
 *
 */

@Service
@Transactional
public class CollegeServiceIMPL implements CollegeService {

	@Autowired
	private CollegeRepository collegeRepository;

	public CollegeServiceIMPL() {

	}

	@Override
	public void saveCollege(College college) {
		collegeRepository.save(college);
	}

	@Override
	public List<College> getCollegeList() {

		return collegeRepository.findAll();
	}

	@Override
	public void deleteCollege(Long id) {

		collegeRepository.deleteById(id);

	}

	@Override
	public College getCollegeById(Long id) throws ResourceNotFoundException {

		return collegeRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + id));
	}

}
