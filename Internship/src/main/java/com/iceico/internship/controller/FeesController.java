/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.iceico.internship.model.FinancialYear;
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

	/* AJAX CALL FOR SEARCH BY DATE */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/fees/summary/filter/date", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public @ResponseBody JSONArray filterStudentListByDate(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws JsonProcessingException, ParseException {

		List<Fees> list = this.feesService.filterFeesByDate(startDate, endDate);

		JSONArray feesArray = new JSONArray();

		for (Fees fees : list) {

			JSONObject studEntryObject = new JSONObject();
			studEntryObject.put("firstName", fees.getStudentEntry().getFirstName());
			studEntryObject.put("middleName", fees.getStudentEntry().getMiddleName());
			studEntryObject.put("lastName", fees.getStudentEntry().getLastName());
			studEntryObject.put("totalFees", fees.getStudentEntry().getFeesAmount());
			studEntryObject.put("paidFees", fees.getStudentEntry().getPaidFees());
			studEntryObject.put("discount", fees.getStudentEntry().getDiscount());
			studEntryObject.put("balanceFees", fees.getStudentEntry().getBalanceFees());
			studEntryObject.put("payStatus", fees.getStudentEntry().getPayStatus());
			studEntryObject.put("collegeName", fees.getStudentEntry().getCollege().getCollegeName());
			studEntryObject.put("departmentName", fees.getStudentEntry().getDepartment().getDepartmentName());
			studEntryObject.put("feesAmount", fees.getFeesAmount());
			studEntryObject.put("feesDate", fees.getDate());
			studEntryObject.put("payMode", fees.getPayMode());
			studEntryObject.put("paidStatus", fees.getStudentEntry().getPayStatus());

			feesArray.add(studEntryObject);
		}
		return feesArray;
	}

	/* AJAX CALL FOR SEARCH BY YEAR */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/fees/summary/filter/year", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public @ResponseBody JSONObject filterStudentListByYear(@RequestParam("year") String year)
			throws JsonProcessingException, ParseException {

		FinancialYear financialYear = this.financialYearService.searchByYear(year);

		JSONObject fyObject = new JSONObject();
		JSONArray feesArray = new JSONArray();

		for (StudentEntry studentEntry : financialYear.getStudentEntry()) {
			for (Fees feesEntry : studentEntry.getFees()) {
				JSONObject feesObject = new JSONObject();

				feesObject.put("firstName", studentEntry.getFirstName());
				feesObject.put("middleName", studentEntry.getMiddleName());
				feesObject.put("lastName", studentEntry.getLastName());
				feesObject.put("collegeName", studentEntry.getCollege().getCollegeName());
				feesObject.put("departmentName", studentEntry.getDepartment().getDepartmentName());
				feesObject.put("totalFees", studentEntry.getFeesAmount());
				feesObject.put("discount", studentEntry.getDiscount());
				feesObject.put("paidFees", studentEntry.getPaidFees());
				feesObject.put("balanceFees", studentEntry.getBalanceFees());
				feesObject.put("feesAmount", feesEntry.getFeesAmount());
				feesObject.put("payDate", feesEntry.getDate());
				feesObject.put("payMode", feesEntry.getPayMode());
				feesObject.put("payStatus", studentEntry.getPayStatus());
				feesArray.add(feesObject);
			}
		}
		fyObject.put("studentEntry", feesArray);
		return fyObject;
	}

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
