/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;
import com.iceico.internship.repository.FinancialYearRepository;
import com.iceico.internship.service.FinancialYearService;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Service
@Transactional
public class FinancialYearServiceIMPL implements FinancialYearService {

	public FinancialYearServiceIMPL() {

	}

	@Autowired
	private FinancialYearRepository financialYearRepository;

	@Autowired
	private EntityManager entityManager;

	private Session getSession() {
		return entityManager.unwrap(Session.class);
	}

	@Override
	public void saveFinancialYear(FinancialYear financialYear) {
		this.financialYearRepository.save(financialYear);
	}

	@Override
	public FinancialYear getFinancialYearById(Long financialYearId) throws ResourceNotFoundException {
		return this.financialYearRepository.findById(financialYearId)
				.orElseThrow(() -> new ResourceNotFoundException("Financial Year Not Found" + financialYearId));
	}

	@Override
	public List<FinancialYear> getFinancialYearList() {
		return this.financialYearRepository.findAll();
	}

	@Override
	public void deleteFinancialYear(Long financialYearId) {
		this.financialYearRepository.deleteById(financialYearId);
	}

	@Override
	public FinancialYear getActiveFinancialYear() {
		return (FinancialYear) this.getSession().createQuery("from FinancialYear where active=:active")
				.setParameter("active", true).uniqueResult();
	}
}