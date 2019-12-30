/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.InternshipType;
import com.iceico.internship.repository.InternshipTypeRepository;
import com.iceico.internship.service.InternshipTypeService;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Service
@Transactional
public class InternshipTypeServiceIMPL implements InternshipTypeService {

	/**
	 * 
	 */
	@Autowired
	private InternshipTypeRepository internshipTypeRepository;

	public InternshipTypeServiceIMPL() {
	}

	@Override
	public void saveIntershipType(InternshipType internshipType) {
		this.internshipTypeRepository.save(internshipType);
	}

	@Override
	public InternshipType getInternshipTypeById(Long internTypeId) throws ResourceNotFoundException {

		return this.internshipTypeRepository.findById(internTypeId)
				.orElseThrow(() -> new ResourceNotFoundException("No Data Found At Id" + internTypeId));
	}

	@Override
	public List<InternshipType> getInternshipTypeList() {

		return this.internshipTypeRepository.findAll();
	}

	@Override
	public void deleteInternshipType(Long internTypeId) {
		this.internshipTypeRepository.deleteById(internTypeId);
	}

}
