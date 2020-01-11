/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.DriveStudent;
import com.iceico.internship.repository.DriveStudentRepository;
import com.iceico.internship.service.DriveStudentService;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 * 
 *          Created Date : 11/01/2020
 *
 */
@Service
@Transactional
public class DriveStudentServiceImpl implements DriveStudentService {

	/**
	 * 
	 */
	public DriveStudentServiceImpl() {

	}

	@Autowired
	private DriveStudentRepository driveStudentRepository;

	@Override
	public void saveDriveStudent(DriveStudent driveStudent) {
		this.driveStudentRepository.save(driveStudent);
	}

	@Override
	public void deleteDriveStudent(Long id) {
		this.driveStudentRepository.deleteById(id);
	}

	@Override
	public List<DriveStudent> getDriveStudentList() {
		return this.driveStudentRepository.findAll();
	}

	@Override
	public DriveStudent getDriveStudentById(Long id) throws ResourceNotFoundException {
		return this.driveStudentRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + id));
	}

}
