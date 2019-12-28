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
 *
 */


@Controller
public class CollegeController {


	@Autowired
	CollegeService collegeService;
	
	@PostMapping("/admin/college/save")
	public String saveCollege(@ModelAttribute("college") @Valid College college,BindingResult result, ModelMap model) {
		if(result.hasErrors()) {
			return  "CollegeInfo";
		}
		collegeService.saveCollege(college);
		return "redirect:/admin/college/all";
	}
	
	
	
	@PostMapping("/admin/college/delete/{id}")
	public String deleteCollege(@PathVariable("id") @Valid Long id, ModelMap modelMap) throws ResourceNotFoundException {
	     collegeService.getCollegeById(id);
	       collegeService.deleteCollege(id);
	   	return "redirect:/admin/college/all";
		}
		
	
	@GetMapping(value="/admin/college/all")
	 
	public String getCollegeList(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("userList",collegeService.getCollegeList());
		return "CollegeInfo";
	}
	
	@GetMapping(value = "/admin/college/update/{id}")
	public String editCollege(@PathVariable("id") @Valid Long id,ModelMap modelMap, Locale locale) throws ResourceNotFoundException {
       College college=collegeService.getCollegeById(id);
   	   modelMap.addAttribute("college",college);
   	   modelMap.addAttribute("edit","EDIT");
   	   //edit=true
   	return "CollegeInfo";
	}
	
	
	
	public CollegeController() {
	
	}
	

	
}
