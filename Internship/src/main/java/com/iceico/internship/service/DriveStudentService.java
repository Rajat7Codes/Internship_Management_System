/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.DriveStudent;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 * 
 *          Created Date : 11/01/2020
 *
 */
public interface DriveStudentService {

	public void saveDriveStudent(DriveStudent driveStudent);

	public void deleteDriveStudent(Long id);

	public List<DriveStudent> getDriveStudentList();

	public DriveStudent getDriveStudentById(Long id) throws ResourceNotFoundException;
}
