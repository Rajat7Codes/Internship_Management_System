/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;
import com.iceico.internship.repository.FeesRepository;
import com.iceico.internship.service.FeesService;

/**
 * @author sameer
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
		;
	}

}
