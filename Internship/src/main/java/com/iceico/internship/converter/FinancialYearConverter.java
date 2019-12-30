/**
 * 
 */
package com.iceico.internship.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;
import com.iceico.internship.service.FinancialYearService;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 * 
 *          Created Date : 29/12/2019
 *
 */
@Component
public class FinancialYearConverter implements Converter<Object, FinancialYear> {

	/**
	 * 
	 */
	public FinancialYearConverter() {

	}

	@Autowired
	private FinancialYearService financialYearService;

	/**
	 * Gets UserProfile by Id
	 * 
	 * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	public FinancialYear convert(Object element) {
		Long id = Long.parseLong((String) element);
		FinancialYear financialYear = null;
		try {
			financialYear = financialYearService.getFinancialYearById(id);
		} catch (ResourceNotFoundException e) {

			e.printStackTrace();
		}
		return financialYear;
	}
}
