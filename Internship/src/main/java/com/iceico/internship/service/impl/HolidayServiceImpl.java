/**
 * 
 */
package com.iceico.internship.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Holiday;
import com.iceico.internship.repository.HolidayRepository;
import com.iceico.internship.service.HolidayService;

/**
 * @author Rajat
 *
 */

@Service
@Transactional
public class HolidayServiceImpl implements HolidayService {

	@Autowired
	private HolidayRepository holidayRepository;
	/**
	 * 
	 */
	public HolidayServiceImpl() {

	}

	@Override
	public void saveHoliday(Holiday holiday) {
		this.holidayRepository.save(holiday);
	}

	@Override
	public void deleteHoliday(Long id) {
		this.holidayRepository.deleteById(id);
	}

	@Override
	public List<Holiday> getHolidayList() {
		return this.holidayRepository.findAll();
	}

	@Override
	public Holiday getHolidayById(Long id) throws ResourceNotFoundException {
		return this.holidayRepository.findById(id).orElseThrow(() 
				-> new ResourceNotFoundException("Not Data Found At Id " + id));
	}

}
