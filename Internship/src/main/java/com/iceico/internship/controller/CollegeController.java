/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.College;
import com.iceico.internship.service.CollegeService;

/**
 * @author Puja
 * @version 0.1 Creation Date: 27/12/2019
 *
 */

@Controller
public class CollegeController {

	@Autowired
	private CollegeService collegeService;

	@GetMapping(value = "/admin/college/new")
	public String newCollege(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("college", new College());

		return "newCollege";
	}

	@PostMapping("/admin/college/save")
	public String saveCollege(@ModelAttribute("college") @Valid College college, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "newCollege";
		} else {
			collegeService.saveCollege(college);
			return "redirect:/admin/college";
		}
	}

	@PostMapping("/admin/college/delete/{id}")
	public String deleteCollege(@PathVariable("id") @Valid Long id, ModelMap modelMap)
			throws ResourceNotFoundException {
		collegeService.deleteCollege(id);
		return "redirect:/admin/college";
	}

	@GetMapping(value = "/admin/college")
	public String getCollegeList(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("collegeList", collegeService.getCollegeList());

		return "college";
	}

	@GetMapping(value = "/admin/college/update/{id}")
	public String editCollege(@PathVariable("id") @Valid Long id, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		College college = collegeService.getCollegeById(id);
		modelMap.addAttribute("college", college);

		return "newCollege";
	}

	public CollegeController() {

	}

}
