/**
 * 
 */
package com.iceico.internship.service;

import java.util.List;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Holiday;

/**
 * @author Rajat
 *
 */
public interface HolidayService {
	public void saveHoliday(Holiday holiday);

	public void deleteHoliday(Long id);

	public List<Holiday> getHolidayList();

	public Holiday getHolidayById(Long id) throws ResourceNotFoundException;
}
