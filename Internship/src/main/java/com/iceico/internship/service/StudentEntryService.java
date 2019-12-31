/**
 * 
 */
package com.iceico.internship.service;

import java.util.Date;
import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.StudentEntry;

/**
 * @author sameer
 *
 */

public interface StudentEntryService {

	public void saveStudentEntry(StudentEntry studentEntry);

	public StudentEntry getStudentEntryById(Long studentEntryId) throws ResourceNotFoundException;

	public List<StudentEntry> getStudentEntryList();

	public void deleteStudentEntry(Long studentEntryId);
	
	public Double getTotalIncome();
	
    public Double getTotalBalance();
    
    public Double getTotalPaidAmount();
    
    public Double getDailyFeesCollection(Date date);
}
