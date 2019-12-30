/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;
import com.iceico.internship.service.FeesService;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author sameer
 *
 */
@Controller
public class FeesController {

	/**
	 * 
	 */
	public FeesController() {
	}

	@Autowired
	private FeesService feesService;

	@Autowired
	private StudentEntryService studentEntryService;

	@GetMapping("/admin/fees")
	public String getFees(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("fees", new Fees());
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		return "feesList";
	}

	@GetMapping("/admin/fees/pay/{studentEntryId}")
	public String payFees(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		return "viewFees";
	}

	@GetMapping("/admin/fees/receipt/{studentEntryId}")
	public String getReceipt(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		return "viewReceipt";
	}
}
