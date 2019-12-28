/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.repository.FinancialYearRepository;
import com.iceico.internship.service.FinancialYearService;
import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;

/**
 * @author Puja \
 */

@Service
@Transactional
public class FinancialYearServiceIMPL implements FinancialYearService {

	@Autowired
	private FinancialYearRepository financialYearRepository;

	public FinancialYearServiceIMPL() {

	}

	@Override
	public void saveFinancialYear(FinancialYear financialYear) {
		financialYearRepository.save(financialYear);

	}

	@Override
	public FinancialYear getFinancialYearById(Long id) throws ResourceNotFoundException {

		return financialYearRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Not Data Found At Id " + id));
	}

	@Override
	public List<FinancialYear> getFinancialYearList() {

		return financialYearRepository.findAll();
	}

	@Override
	public void deleteFinancialYear(Long id) {

		financialYearRepository.deleteById(id);

	}

}