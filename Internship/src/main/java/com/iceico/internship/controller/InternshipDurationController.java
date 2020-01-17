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
import com.iceico.internship.model.InternshipDuration;
import com.iceico.internship.service.InternshipDurationService;

/**
 * @author Rajat
 *
 */
@Controller
public class InternshipDurationController {

	/**
	 * 
	 */
	public InternshipDurationController() {

	}

	@Autowired
	private InternshipDurationService internshipDurationService;

	@GetMapping("/admin/internship/duration")
	public String getInternshipDurationPage(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("internshipDurationList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("internshipDuration", new InternshipDuration());
		modelMap.addAttribute("edit", false);
		modelMap.addAttribute("user", this.getPrincipal());
		return "internshipDuration";
	}

	@GetMapping("/admin/internship/duration/edit/{id}")
	public String editInternshipDuration(@PathVariable("id") Long id, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("internshipDurationList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("internshipDuration", this.internshipDurationService.getInternshipDurationById(id));
		modelMap.addAttribute("edit", true);
		modelMap.addAttribute("user", this.getPrincipal());
		return "internshipDuration";
	}

	@PostMapping("/admin/internship/duration/save")
	public String saveInternshipDuration(
			@ModelAttribute("internshipDuration") @Valid InternshipDuration internshipDuration,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {

		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("internshipDurationList", this.internshipDurationService.getInternshipDurationList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "internshipDuration";
		} else {
			this.internshipDurationService.saveInternshipDuration(internshipDuration);
			modelMap.addAttribute("user", this.getPrincipal());
			return "redirect:/admin/internship/duration";
		}
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
