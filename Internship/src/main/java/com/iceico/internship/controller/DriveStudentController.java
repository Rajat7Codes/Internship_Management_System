/**
 * 
 */
package com.iceico.internship.controller;

import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.DriveStudent;
import com.iceico.internship.service.CollegeService;
import com.iceico.internship.service.DriveStudentService;

/**
 * @author LEKHA BHANGE
 * @version 0.1
 *
 *          Created Date : 11/01/2020
 *
 */
@Controller
public class DriveStudentController {

	/**
	 * 
	 */
	public DriveStudentController() {

	}
	
	@Autowired
	private DriveStudentService driveStudentService;

	@Autowired
	private CollegeService collegeService;

	@GetMapping(value = "/admin/internship/drive/student/new")
	public String newInternshipDriveStudent(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("driveStudent", new DriveStudent());
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("edit", false);
		modelMap.addAttribute("user", this.getPrincipal());
		return "newDriveStudent";
	}

	@GetMapping(value = "/admin/internship/drive/student")
	public String getInternshipDriveStudent(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("driveStudentList", this.driveStudentService.getDriveStudentList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "driveStudent";
	}

	@PostMapping("/admin/internship/drive/student/save")
	public String saveInternshipDriveStudent(@ModelAttribute("driveStudent") @Valid DriveStudent driveStudent, BindingResult bindingResult,
			ModelMap modelMap, Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("driveStudentList", this.driveStudentService.getDriveStudentList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "newDriveStudent";
		} else {
			this.driveStudentService.saveDriveStudent(driveStudent);
			modelMap.addAttribute("user", this.getPrincipal());
			return "redirect:/admin/internship/drive/student";
		}
	}

	@GetMapping("/admin/internship/drive/student/edit/{id}")
	public String editInternshipDriveStudent(@PathVariable("id") Long id, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("edit", true);
		modelMap.addAttribute("driveStudent", this.driveStudentService.getDriveStudentById(id));
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "newDriveStudent";
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
