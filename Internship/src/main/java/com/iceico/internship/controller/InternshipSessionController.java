/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
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
import com.iceico.internship.model.InternshipSession;
import com.iceico.internship.service.impl.InternshipSessionServiceImpl;

/**
 * @author Rajat
 *
 */
@Controller
public class InternshipSessionController {

	@Autowired
	InternshipSessionServiceImpl sessionServiceImpl;
	
	/**
	 * 
	 */
	public InternshipSessionController() {

	}

	@GetMapping("/admin/internship/session")
	public String internshipSession(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("edit", "ADD");
		modelMap.addAttribute("session", new InternshipSession());
		modelMap.addAttribute("sessionList", sessionServiceImpl.getSessionList());
		return "session";
	}
	
	@PostMapping("/admin/internship/session/add")
	public String saveInternshipSession(@ModelAttribute("session") @Valid InternshipSession session, BindingResult bindingResult, ModelMap modelMap, Locale locale) throws ParseException {
		if(bindingResult.hasErrors()) {
			System.out.print(bindingResult.getAllErrors());
		} else {
			sessionServiceImpl.saveSession(session);
		}
		return "redirect:/admin/internship/session";
	}

	
	@GetMapping("/admin/internship/session/edit/{sessionId}")
	public String editInternshipSession(@PathVariable("sessionId") @Valid Long sessionId, ModelMap modelMap, Locale locale) throws ParseException, ResourceNotFoundException {
		modelMap.addAttribute("edit", "UPDATE");
		modelMap.addAttribute("session", sessionServiceImpl.getSessionById(sessionId));
		modelMap.addAttribute("sessionList", sessionServiceImpl.getSessionList());
		return "redirect:/admin/internship/session";
	}
}
