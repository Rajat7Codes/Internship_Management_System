/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author sameer
 *
 */
@Controller
public class InternshipTypeController {

	/**
	 * 
	 */
	public InternshipTypeController() {

	}

	@GetMapping("/admin/internshipType")
	public String getInternshipType(ModelMap modelMap, Locale locale) {

		return "internshipType";
	}

}
