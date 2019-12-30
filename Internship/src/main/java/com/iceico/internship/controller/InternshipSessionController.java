/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
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
import com.iceico.internship.model.InternshipSession;
import com.iceico.internship.service.InternshipSessionService;

/**
 * @author Rajat
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
 *
 */
@Controller
public class InternshipSessionController {

	@Autowired
	InternshipSessionService internshipSessionService;

	/**
	 * 
	 */
	public InternshipSessionController() {

	}

	@GetMapping("/admin/internship/session")
	public String internshipSession(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("session", new InternshipSession());
		modelMap.addAttribute("sessionList", internshipSessionService.getSessionList());
		return "internshipSession";
	}

	@PostMapping("/admin/internship/session/save")
	public String saveInternshipSession(@ModelAttribute("session") @Valid InternshipSession session,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) throws ParseException {
		if (bindingResult.hasErrors()) {
			System.out.print(bindingResult.getAllErrors());
			return "internshipSession";
		} else {
			if (session.getSessionId() == null) {

				this.internshipSessionService.saveSession(session);
				modelMap.addAttribute("user", this.getPrincipal());
			} else {
				this.internshipSessionService.saveSession(session);
			}
			return "redirect:/admin/internship/session";
		}
	}

	@GetMapping("/admin/internship/session/edit/{sessionId}")
	public String editInternshipSession(@PathVariable("sessionId") @Valid Long sessionId, ModelMap modelMap,
			Locale locale) throws ParseException, ResourceNotFoundException {
		modelMap.addAttribute("session", internshipSessionService.getSessionById(sessionId));
		modelMap.addAttribute("sessionList", internshipSessionService.getSessionList());
		return "internshipSession";
	}

	@GetMapping("/admin/internship/session/delete/{sessionId}")
	public String deleteInternshipSession(@PathVariable("sessionId") @Valid Long sessionId, ModelMap modelMap,
			Locale locale) throws ParseException, ResourceNotFoundException {
		internshipSessionService.deleteSession(sessionId);
		modelMap.addAttribute("sessionList", internshipSessionService.getSessionList());
		return "redirect:/admin/internship/session";
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
