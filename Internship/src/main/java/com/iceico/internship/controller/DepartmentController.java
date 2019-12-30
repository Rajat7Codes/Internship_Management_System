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
import com.iceico.internship.model.Department;
import com.iceico.internship.service.DepartmentService;

/**
 * @author Rajat
 * @version 0.1
 * 
 * Created Date : 30/12/2019
 */
@Controller
public class DepartmentController {

	/**
	 * 
	 */
	public DepartmentController() {

	}
	
	@Autowired
	private DepartmentService departmentService;
	
	
	@GetMapping("/admin/internship/department")
	public String getDepartment(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("department", new Department());
		modelMap.addAttribute("user", this.getPrincipal());
		return "department";
	}
	
	@PostMapping("/admin/internship/department/save")
	public String saveDepartment(
		@ModelAttribute("department") @Valid Department department,
		BindingResult bindingResult, ModelMap modelMap, Locale locale) {

		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "department";
		} else {
			this.departmentService.saveDepartment(department);
			modelMap.addAttribute("user", this.getPrincipal());
			return "redirect:/admin/internship/department";
		}
	}
	
	@GetMapping("/admin/internship/department/edit/{id}")
	public String editDepartment(@PathVariable("id") Long departmentId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("department", this.departmentService.getDepartmentById(departmentId));
		modelMap.addAttribute("user", this.getPrincipal());
		return "department";
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
