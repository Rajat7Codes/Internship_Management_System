/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.College;

/**
 * @author Puja Pokale
 * @version 0.1
 * 
 *          Created Date : 28/12/2019
 *
 */
public interface CollegeService {

	public void saveCollege(College college);

	public void deleteCollege(Long id);

	public List<College> getCollegeList();

	public College getCollegeById(Long id) throws ResourceNotFoundException;
}

