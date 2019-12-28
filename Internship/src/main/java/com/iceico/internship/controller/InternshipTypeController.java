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
import com.iceico.internship.model.InternshipType;
import com.iceico.internship.service.InternshipTypeService;

/**
 * @author sameer
 *
 */
@Controller
public class InternshipTypeController {

	/**
	 * 
	 */
	public InternshipTypeController() {

	}

	@Autowired
	private InternshipTypeService internshipTypeService;

	@GetMapping("/admin/internship/type")
	public String getInternshipType(ModelMap modelMap, Locale locale) {
<<<<<<< HEAD
		
=======
		modelMap.addAttribute("internshipType", new InternshipType());
		modelMap.addAttribute("internshipTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "internshipType";
	}

	@PostMapping("/admin/internship/type/save")
	public String saveExpenses(@ModelAttribute("internshipType") @Valid InternshipType internshipType,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("internshipTypeList", this.internshipTypeService.getInternshipTypeList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "internshipType";
		} else {

			if (internshipType.getInternTypeId() == null) {

				this.internshipTypeService.saveIntershipType(internshipType);
				modelMap.addAttribute("user", this.getPrincipal());
			} else {
				this.internshipTypeService.saveIntershipType(internshipType);
			}
			return "redirect:/admin/internship/type";
		}
	}

	@GetMapping("/admin/internshipType/edit/{internTypeId}")
	public String editInternshipType(@PathVariable("internTypeId") @Valid Long internTypeId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("internshipType", this.internshipTypeService.getInternshipTypeById(internTypeId));
		modelMap.addAttribute("internshipTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("user", this.getPrincipal());

>>>>>>> f40f513bbfdb0216ba28e0be5e5c73e706f6b6a9
		return "internshipType";
	}

	@GetMapping("/admin/internshipType/delete/{internTypeId}")
	public String deleteInternshipType(@PathVariable("internTypeId") @Valid Long internTypeId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		this.internshipTypeService.deleteInternshipType(internTypeId);

		modelMap.addAttribute("user", this.getPrincipal());
		return "redirect:/admin/internship/type";
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
