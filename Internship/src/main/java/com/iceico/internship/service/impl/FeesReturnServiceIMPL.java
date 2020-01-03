/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FeesReturn;
import com.iceico.internship.repository.FeesReturnRepository;
import com.iceico.internship.service.FeesReturnService;

/**
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

@Service
@Transactional
public class FeesReturnServiceIMPL implements FeesReturnService {

	public FeesReturnServiceIMPL() {

	}

	@Autowired
	private FeesReturnRepository feesReturnRepository;

	@Override
	public void saveFeesReturn(FeesReturn feesReturn) {
		feesReturnRepository.save(feesReturn);
	}

	@Override
	public FeesReturn getFeesReturnById(Long feesReturnId) throws ResourceNotFoundException {

		return this.feesReturnRepository.findById(feesReturnId)
				.orElseThrow(() -> new ResourceNotFoundException("No data found ate Id" + feesReturnId));

	}

	@Override
	public List<FeesReturn> getFeesReturnList() {

		return this.feesReturnRepository.findAll();
	}

	@Override
	public void deleteFeesReturn(Long feesReturnId) {
		this.feesReturnRepository.deleteById(feesReturnId);
	}

}
