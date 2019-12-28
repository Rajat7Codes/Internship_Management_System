/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;
import com.iceico.internship.repository.FinancialYearRepository;
import com.iceico.internship.service.FinancialYearService;

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

	public FinancialYear getFinancialYearById(Long financialYearId) throws ResourceNotFoundException {

		return financialYearRepository.findById(financialYearId)
				.orElseThrow(() -> new ResourceNotFoundException("Financial Year Not Found" + financialYearId));

	}

	@Override
	public List<FinancialYear> getFinancialYearList() {

		return financialYearRepository.findAll();
	}

	@Override

	public void deleteFinancialYear(Long financialYearId) {

		financialYearRepository.deleteById(financialYearId);

	}

}