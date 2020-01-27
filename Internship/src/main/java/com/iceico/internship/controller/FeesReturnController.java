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
import com.iceico.internship.model.FeesReturn;
import com.iceico.internship.service.FeesReturnService;
import com.iceico.internship.service.StudentEntryService;
import com.iceico.internship.util.ListHelper;

/**
 * @author Puja Pokale
 * @Date 03/01/2020
 *
 */

@Controller
public class FeesReturnController {

	@Autowired
	private StudentEntryService studentEntryService;

	@Autowired
	private FeesReturnService feesReturnService;

	@Autowired
	private ListHelper listHelper;

	@GetMapping("/admin/fees/return/{studentEntryId}")
	public String feesReturn(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("feesReturn", new FeesReturn());
		modelMap.addAttribute("statusList", this.listHelper.getStatusList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "feesReturn";
	}

	@PostMapping("/admin/fees/return/save")
	public String saveFeesReturn(@ModelAttribute("feesReturn") @Valid FeesReturn feesReturn,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {

		Double paidAmount = feesReturn.getStudentEntry().getPaidFees();
		Double balanceAmount = feesReturn.getStudentEntry().getBalanceFees();
		Double feesAmount = feesReturn.getStudentEntry().getFeesAmount();
		Double discount = feesReturn.getStudentEntry().getDiscount();
		String studentStatus;
		String status;

		if (paidAmount != 0) {

			paidAmount = 0.00;
			feesReturn.getStudentEntry().setPaidFees(paidAmount);

			balanceAmount = feesAmount - discount;

			feesReturn.getStudentEntry().setBalanceFees(balanceAmount);

			status = "Refund";
			feesReturn.getStudentEntry().setPayStatus(status);

			studentStatus = "Discontinued";
			feesReturn.getStudentEntry().setStudentStatus(studentStatus);
		}

		this.feesReturnService.saveFeesReturn(feesReturn);

		return "redirect:/admin/fees";
	}

	public FeesReturnController() {

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
