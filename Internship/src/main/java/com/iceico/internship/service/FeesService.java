/**
 * 
 */
package com.iceico.internship.service;

import java.util.Date;
import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
public interface FeesService {

	public void saveFees(Fees fees);

	public Fees getFeesById(Long feesId) throws ResourceNotFoundException;

	public List<Fees> getFeesList();

	public void deleteFees(Long feesId);

	public Double getdailyFeesCollection(Date date);
}
