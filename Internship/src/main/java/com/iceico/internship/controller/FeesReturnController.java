/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.iceico.internship.service.FeesReturnService;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

@Controller
public class FeesReturnController {

	@Autowired
	private FeesReturnService feesReturnService;

	@Autowired
	private StudentEntryService studentEntryService;

	@GetMapping(value = "/admin/fees/return")
	public String returnFees(ModelMap modelMap, Locale locale) {

		return "feesReturn";
	}

	public FeesReturnController() {

	}

}
