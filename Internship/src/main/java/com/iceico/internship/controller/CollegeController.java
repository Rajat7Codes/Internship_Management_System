/**
 * 
 */
package com.iceico.internship.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/admin/college/")
	public String saveCollege(@ModelAttribute("college") @Valid College college,BindingResult result, ModelMap model) {
		if(result.hasErrors()) {
			return  "addCollegeInfo";
		}
		
		
		collegeService.saveCollege(college);
		return "redirect:/admin/college";
	}
	
	public CollegeController() {
	
	}

}
