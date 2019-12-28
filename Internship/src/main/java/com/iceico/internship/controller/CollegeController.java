/**
 * 
 */
package com.iceico.internship.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.College;
import com.iceico.internship.service.CollegeService;

/**
 * @author Puja
 *
 */


@Controller
public class CollegeController {


	@Autowired
	CollegeService collegeService;
	
	@PostMapping("/admin/college/save")
	public String saveCollege(@ModelAttribute("college") @Valid College college,BindingResult result, ModelMap model) {
		if(result.hasErrors()) {
			return  "addCollegeInfo";
		}
		collegeService.saveCollege(college);
		return "redirect:/admin/college";
	}
	
	@GetMapping("/admin/college/delete/{id}")
	public String deleteCollege(@PathVariable("id") @Valid Long id, ModelMap modelMap) throws ResourceNotFoundException {
	     collegeService.getCollegeById(id);
	       collegeService.deleteCollege(id);
	   	return "redirect:/admin/college";
		}
		
	
	
	
	public CollegeController() {
	
	}
	

	
}
