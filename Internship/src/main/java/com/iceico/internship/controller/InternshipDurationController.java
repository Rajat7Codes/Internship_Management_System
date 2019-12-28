/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.iceico.internship.service.InternshipDurationService;

/**
 * @author Rajat
 *
 */
@Controller
public class InternshipDurationController {

	@Autowired
	InternshipDurationService internshipDurationService;
	
	/**
	 * 
	 */
	public InternshipDurationController() {

	}

	@GetMapping("/admin/internship/duration")
	public String internshipDurations(ModelMap modelMap, Locale locale) {
		return "internshipDuration";
	}
	
}
