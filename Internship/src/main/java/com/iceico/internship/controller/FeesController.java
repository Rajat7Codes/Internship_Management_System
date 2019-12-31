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
import com.iceico.internship.model.Fees;
import com.iceico.internship.service.FeesService;
import com.iceico.internship.service.StudentEntryService;
import com.iceico.internship.util.ListHelper;

/**
 * @author sameer
 *
 */
@Controller
public class FeesController {

	/**
	 * 
	 */
	public FeesController() {
	}

	@Autowired
	private FeesService feesService;

	@Autowired
	private StudentEntryService studentEntryService;

	@Autowired
	private ListHelper listHelper;

	@GetMapping("/admin/fees")
	public String getFees(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("fees", new Fees());
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "feesList";
	}

	@GetMapping("/admin/fees/pay/{studentEntryId}")
	public String payFees(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("fees", new Fees());
		modelMap.addAttribute("payModeList", this.listHelper.getPaymentModeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "payFees";
	}

	@GetMapping("/admin/fees/receipt/{studentEntryId}")
	public String getReceipt(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("user", this.getPrincipal());

		return "viewReceipt";
	}

	@PostMapping("/admin/fees/save")
	public String saveFees(@ModelAttribute("fees") @Valid Fees fees, BindingResult bindingResult, ModelMap modelMap,
			Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("feesList", this.feesService.getFeesList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "feesList";
		} else {
//			System.out.println("paid amt ====>>>" + fees.getStudentEntry().getPaidFees());
//			Float prevPaidAmt = fees.getStudentEntry().getPaidFees();

//			Float paidAmt = fees.getFeesAmount();
//			System.out.println("paidAmt====" + paidAmt);
//
//			StudentEntry entry = fees.getStudentEntry();
//			System.out.println("fees amt===========" + entry.getFeesAmount());
//
//			Float totalAmt = fees.getStudentEntry().getFeesAmount();
//			System.out.println("totalAmt====" + totalAmt);
//			Float disAmt = fees.getStudentEntry().getDiscount();
//			System.out.println("disAmt===" + disAmt);
//
//			Float finalAmt = totalAmt - disAmt;
//			System.out.println("finalAmt====" + finalAmt);

//			fees.getStudentEntry().setBalanceFees(finalAmt - paidAmt);
//			fees.getStudentEntry().setPaidFees(prevPaidAmt + paidAmt);

			this.feesService.saveFees(fees);
			modelMap.addAttribute("user", this.getPrincipal());
			return "redirect:/admin/fees";
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
