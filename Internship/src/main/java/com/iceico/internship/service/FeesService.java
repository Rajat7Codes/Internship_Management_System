/**
 * 
 */
package com.iceico.internship.service;

import java.util.Date;
import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;

/**
 * @author sameer
 *
 */
public interface FeesService {

	public void saveFees(Fees fees);

	public Fees getFeesById(Long feesId) throws ResourceNotFoundException;

	public List<Fees> getFeesList();

	public void deleteFees(Long feesId);
	
	public Double getdailyFeesCollection(Date date);
}
