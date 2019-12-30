/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.College;
/**
 * @author Puja
 * @version 0.1
 * Creation Date: 27/12/2019
 *
 */
public interface CollegeService {

	public void saveCollege(College college);

	public College getCollegeById(Long id) throws ResourceNotFoundException;

	public List<College> getCollegeList();

	public void deleteCollege(Long id);

}

