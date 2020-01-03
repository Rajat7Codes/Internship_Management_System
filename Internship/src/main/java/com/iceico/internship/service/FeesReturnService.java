package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;

import com.iceico.internship.model.FeesReturn;

/**
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

public interface FeesReturnService {

	public void saveFeesReturn(FeesReturn feesReturn);

	public FeesReturn getFeesReturnById(Long feesReturnId) throws ResourceNotFoundException;

	public List<FeesReturn> getFeesReturnList();

	public void deleteFeesReturn(Long feesReturnId);

}
