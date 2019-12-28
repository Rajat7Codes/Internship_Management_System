/**
 * 
 */
package com.iceico.internship.service;

import com.iceico.internship.model.InternshipType;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;

/**
 * @author sameer
 *
 */
public interface InternshipTypeService {

	public void saveIntershipType(InternshipType internshipType);

	public InternshipType getInternshipTypeById(Long internTypeId) throws ResourceNotFoundException;

	public List<InternshipType> getInternshipTypeList();

	public void deleteInternshipType(Long internTypeId);
}
