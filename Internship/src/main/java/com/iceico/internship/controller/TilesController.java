/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;

/**
 * @author PRAFUL MESHRAM
 * @version 0.1
 * 
 *          Created Date : 22/10/2019
 * 
 *          Updated Date :
 *
 */
@Controller
public class TilesController {

	@RequestMapping("/admin/dashboard")
	public String adminDashboard(ModelMap modelMap, Locale locale) throws ResourceNotFoundException, ParseException {

		modelMap.addAttribute("user", this.getPrincipal());
		return "adminDashboard";
	}

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
