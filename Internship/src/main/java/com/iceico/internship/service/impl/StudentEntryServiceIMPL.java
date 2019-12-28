/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.repository.StudentEntryRepository;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author sameer
 *
 */
@Service
@Transactional
public class StudentEntryServiceIMPL implements StudentEntryService {

	/**
	 * 
	 */
	public StudentEntryServiceIMPL() {
	}

	@Autowired
	private StudentEntryRepository studentEntryRepository;

	@Override
	public void saveStudentEntry(StudentEntry studentEntry) {
		this.studentEntryRepository.save(studentEntry);

	}

	@Override
	public StudentEntry getStudentEntryById(Long studentEntryId) throws ResourceNotFoundException {
		return this.studentEntryRepository.findById(studentEntryId)
				.orElseThrow(() -> new ResourceNotFoundException("Student Entry Not Found" + studentEntryId));
	}

	@Override
	public List<StudentEntry> getStudentEntryList() {

		return this.studentEntryRepository.findAll();
	}

	@Override
	public void deleteStudentEntry(Long studentEntryId) {
		this.studentEntryRepository.deleteById(studentEntryId);
	}

}
