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
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.service.InternshipDurationService;
import com.iceico.internship.service.InternshipTypeService;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author sameer
 *
 */
@Controller
public class StudentEntryController {

	/**
	 * 
	 */
	public StudentEntryController() {
	}

	@Autowired
	private StudentEntryService studentEntryService;

	@Autowired
	private InternshipTypeService internshipTypeService;

	@Autowired
	private InternshipDurationService InternshipDurationService;

	@GetMapping("/admin/student/entry")
	public String getStudentEntry(ModelMap modelMap, Locale locale) {

		modelMap.addAttribute("studentEntry", new StudentEntry());
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "studentEntry";
	}

	@GetMapping("/admin/student/entry/new")
	public String newStudentEntry(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntry", new StudentEntry());
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "newStudentEntry";
	}

	@PostMapping("/admin/student/entry/save")
	public String saveExpenses(@ModelAttribute("studentEntry") @Valid StudentEntry studentEntry,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "studentEntry";
		} else {
			if (studentEntry.getStudentEntryId() == null) {
				this.studentEntryService.saveStudentEntry(studentEntry);
				modelMap.addAttribute("user", this.getPrincipal());
			} else {
				this.studentEntryService.saveStudentEntry(studentEntry);
			}
			return "redirect:/admin/student/entry";
		}
	}

	@GetMapping("/admin/student/entry/edit/{studentEntryId}")
	public String editStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "newStudentEntry";
	}

	@GetMapping("/admin/student/entry/delete/{studentEntryId}")
	public String deleteStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		this.studentEntryService.deleteStudentEntry(studentEntryId);
		modelMap.addAttribute("user", this.getPrincipal());

		return "redirect:/admin/student/entry";
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
