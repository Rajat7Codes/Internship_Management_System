/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;
import com.iceico.internship.repository.FeesRepository;
import com.iceico.internship.service.FeesService;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Service
@Transactional
public class FeesServiceImpl implements FeesService {

	/**
	 * 
	 */
	public FeesServiceImpl() {

	}

	@Autowired
	private FeesRepository feesRepository;

	@Autowired
	private EntityManager entityManager;

	private Session getSession() {
		return entityManager.unwrap(Session.class);
	}

	@Override
	public void saveFees(Fees fees) {
		this.feesRepository.save(fees);
	}

	@Override
	public Fees getFeesById(Long feesId) throws ResourceNotFoundException {
		return this.feesRepository.findById(feesId)
				.orElseThrow(() -> new ResourceNotFoundException("Fees Not Found" + feesId));
	}

	@Override
	public List<Fees> getFeesList() {
		return this.feesRepository.findAll();
	}

	@Override
	public void deleteFees(Long feesId) {
		this.feesRepository.deleteById(feesId);
	}

	@Override
	public Double getdailyFeesCollection(Date date) {
		// System.out.println("date====> "+date);
		return (Double) this.getSession().createQuery("select sum(feesAmount) from Fees where date=:date ")
				.setParameter("date", date).uniqueResult();
	}

}
