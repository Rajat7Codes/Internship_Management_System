/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.iceico.internship.model.Session;
import com.iceico.internship.service.impl.SessionServiceImpl;

/**
 * @author Rajat
 *
 */
@Controller
public class SessionController {

	@Autowired
	SessionServiceImpl sessionServiceImpl;
	
	/**
	 * 
	 */
	public SessionController() {

	}

	@GetMapping("/admin/internship/session")
	public String internshipSession(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("edit", "ADD");
		modelMap.addAttribute("session", new Session());
		modelMap.addAttribute("sessionList", sessionServiceImpl.getSessionList());
		return "session";
	}
	
	@PostMapping("admin/internship/session/add")
	public String saveInternshipSession(@ModelAttribute("user") @Valid Session session, BindingResult bindingResult, ModelMap modelMap, Locale locale) throws ParseException {
		if(bindingResult.hasErrors()) {
			System.out.print(bindingResult.getAllErrors());
		} else {
			//new SimpleDateFormat("dd/MM/yyyy").setLenient(false); 
			//new SimpleDateFormat("dd/MM/yyyy").setLenient(false);  
			sessionServiceImpl.saveSession(session);
		}

		return "redirect:/admin/internship/session";
	}
}
