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
import com.iceico.internship.model.Holiday;
import com.iceico.internship.service.HolidayService;

/**
 * @author Rajat
 *
 */

@Controller
public class HolidayController {

	@Autowired
	private HolidayService holidayService;
	
	/**
	 * 
	 */
	public HolidayController() {

	}

	@GetMapping("/admin/holiday")
	public String getHoldiay(ModelMap modelMap, Locale locale) {

		modelMap.addAttribute("holiday", new Holiday());
		modelMap.addAttribute("holidayList",  this.holidayService.getHolidayList());
		modelMap.addAttribute("edit", false);
		return "holiday";
	}
	
	@PostMapping("/admin/holiday/save")
	public String saveHoldiay(@ModelAttribute("holiday") @Valid Holiday holiday,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) throws ParseException {
		if (bindingResult.hasErrors()) {
			System.out.print(bindingResult.getAllErrors());
			return "holiday";
		} else {
			if (holiday.getHolidayId() == null) {
				this.holidayService.saveHoliday(holiday);
				modelMap.addAttribute("user", this.getPrincipal());
			} else {
				this.holidayService.saveHoliday(holiday);
			}
			return "redirect:/admin/holiday";
		}
	}
	
	@GetMapping("/admin/holiday/edit/{holidayId}")
	public String editInternshipSession(@PathVariable("holidayId") @Valid Long holidayId, ModelMap modelMap,
			Locale locale) throws ParseException, ResourceNotFoundException {
		modelMap.addAttribute("holiday", this.holidayService.getHolidayById(holidayId));
		modelMap.addAttribute("holidayList", this.holidayService.getHolidayList());
		modelMap.addAttribute("edit", true);
		return "holiday";
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
