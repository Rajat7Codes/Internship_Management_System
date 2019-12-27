/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

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
		// TODO Auto-generated constructor stub
	}

	public String getInternshipType(ModelMap modelMap, Locale locale) {

		return "internshipType";
	}

}
