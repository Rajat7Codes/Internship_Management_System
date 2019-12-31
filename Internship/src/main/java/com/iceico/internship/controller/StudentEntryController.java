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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.service.CollegeService;
import com.iceico.internship.service.DepartmentService;
import com.iceico.internship.service.FinancialYearService;
import com.iceico.internship.service.InternshipDurationService;
import com.iceico.internship.service.InternshipSessionService;
import com.iceico.internship.service.InternshipTypeService;
import com.iceico.internship.service.StudentEntryService;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
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
	private InternshipDurationService internshipDurationService;

	@Autowired
	private InternshipSessionService internshipSessionService;

	@Autowired
	private FinancialYearService financialYearService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private CollegeService collegeService;

	@GetMapping("/admin/student/entry/new")
	public String getStudentEntry(ModelMap modelMap, Locale locale) {
		StudentEntry studentEntry = new StudentEntry();
		studentEntry.setFinancialYear(this.financialYearService.getActiveFinancialYear());

		modelMap.addAttribute("studentEntry", studentEntry);
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "newStudentEntry";
	}

	@GetMapping("/admin/student/entry")
	public String newStudentEntry(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "studentEntry";
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
				modelMap.addAttribute("user", this.getPrincipal());
			}

			return "redirect:/admin/student/entry";
		}
	}

	@GetMapping("/admin/student/entry/edit/{studentEntryId}")
	public String editStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "newStudentEntry";
	}

	
	
	@GetMapping("/admin/student/entry/view/{studentEntryId}")
	public String viewStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "viewStudentEntry";
	}
	
	



	@GetMapping("/admin/student/entry/delete/{studentEntryId}")
	public String deleteStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		this.studentEntryService.deleteStudentEntry(studentEntryId);
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
