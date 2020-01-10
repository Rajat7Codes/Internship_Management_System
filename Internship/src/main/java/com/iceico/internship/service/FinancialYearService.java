/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
public interface FinancialYearService {

	public void saveFinancialYear(FinancialYear financialYear);

	public FinancialYear getFinancialYearById(Long financialYearId) throws ResourceNotFoundException;

	public List<FinancialYear> getFinancialYearList();

	public void deleteFinancialYear(Long financialYearId);

	public FinancialYear getActiveFinancialYear();

}
