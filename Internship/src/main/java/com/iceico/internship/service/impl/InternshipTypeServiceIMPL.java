/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.InternshipType;
import com.iceico.internship.repository.InternshipTypeRepository;
import com.iceico.internship.service.InternshipTypeService;

/**
 * @author sameer
 *
 */
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
				.orElseThrow(() -> new ResourceNotFoundException("Internship Type Not Found" + internTypeId));
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
