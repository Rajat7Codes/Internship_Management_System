/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.InternshipDuration;

/**
 * @author Rajat
 *
 */
public interface InternshipDurationService {
	public void saveInternshipDuration(InternshipDuration internshipDuration);

	public void deleteInternshipDuration(Long id);

	public List<InternshipDuration> getInternshipDurationList();

	public InternshipDuration getInternshipDurationById(Long id) throws ResourceNotFoundException;
}
