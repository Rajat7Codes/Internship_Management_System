/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.Fees;
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.service.FeesService;
import com.iceico.internship.service.FinancialYearService;
import com.iceico.internship.service.StudentEntryService;
import com.iceico.internship.util.ListHelper;

/**
 * @author SAMEER KADGAYE
 * @version 0.1
 * 
 *          Created Date : 27/12/2019
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
	private FinancialYearService financialYearService;

	@Autowired
	private ListHelper listHelper;

	@GetMapping("/admin/fees")
	public String getFees(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("studentEntry", new StudentEntry());
		modelMap.addAttribute("user", this.getPrincipal());
		return "feesList";
	}

	@GetMapping("/admin/fees/summary")
	public String getFeesSummary(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("financialYearList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "feesSummary";
	}

	//////////////////////////////////////////////////////

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/fees/summary/filter/date", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public @ResponseBody List<Fees> filterStudentListByDate(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws JsonProcessingException, ParseException {

		/*
		 * System.out.println("sdate========"+startDate);
		 * System.out.println("edate========"+endDate);
		 * System.out.println("year========"+year);
		 */

		return this.feesService.filterFeesByDate(startDate, endDate);

	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/fees/summary/filter/year", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public @ResponseBody List<Fees> filterStudentListByYear(@RequestParam("year") String year)
			throws JsonProcessingException, ParseException {

		/*
		 * System.out.println("year========" + year); List<Fees> feesList =
		 * feesService.filterFeesByYear(year);
		 * 
		 * for (Fees fees : feesList) { System.out.println("Fees amt ====> " +
		 * fees.getFeesAmount()); }
		 */

		return this.feesService.filterFeesByYear(year);
	}

	//////////////////////////////////////////////////////////

	@GetMapping("/admin/fees/pay/{studentEntryId}")
	public String payFees(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("fees", new Fees());
		modelMap.addAttribute("payModeList", this.listHelper.getPaymentModeList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "payFeesNew";
	}

	@GetMapping("/admin/fees/receipt/view/{studentEntryId}")
	public String getReceipt(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("user", this.getPrincipal());
		return "viewReceipt";
	}

	@GetMapping("/admin/fees/receipt/print/{feesId}")
	public String printReciept(@PathVariable("feesId") Long feesId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		modelMap.addAttribute("fees", this.feesService.getFeesById(feesId));
		modelMap.addAttribute("studentEntry", this.feesService.getFeesById(feesId).getStudentEntry());
		modelMap.addAttribute("user", this.getPrincipal());
		return "printReceipt";
	}

	@GetMapping("/admin/fees/receipt/edit/{feesId}")
	public String editReciept(@PathVariable("feesId") Long feesId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException {
		Fees fees = this.feesService.getFeesById(feesId);
		modelMap.addAttribute("studentEntry", fees.getStudentEntry());
		modelMap.addAttribute("payModeList", this.listHelper.getPaymentModeList());
		modelMap.addAttribute("fees", fees);
		modelMap.addAttribute("user", this.getPrincipal());
		return "payFeesNew";
	}

	@PostMapping("/admin/fees/save")
	public String saveFees(@ModelAttribute("fees") @Valid Fees fees, BindingResult bindingResult, ModelMap modelMap,
			Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("feesList", this.feesService.getFeesList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "feesList";
		} else {
			Double prevPaidAmt = fees.getStudentEntry().getPaidFees();
			Double totalBalAmt = fees.getStudentEntry().getBalanceFees();
			Double paidAmt = fees.getFeesAmount();
			String status;

			Double finalBalAmt = totalBalAmt - paidAmt;
			System.out.println("final bal amt =====>>" + finalBalAmt);

			if (finalBalAmt == 0) {
				status = "Paid";
				fees.getStudentEntry().setPayStatus(status);
			}

			if (paidAmt == 0) {
				status = "Unpaid";
				fees.getStudentEntry().setPayStatus(status);
			}

			fees.getStudentEntry().setPaidFees(prevPaidAmt + paidAmt);
			fees.getStudentEntry().setBalanceFees(finalBalAmt);

			modelMap.addAttribute("user", this.getPrincipal());
			this.feesService.saveFees(fees);

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
