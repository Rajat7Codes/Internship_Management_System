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
	public @ResponseBody List<Fees> filterStudentListByDate(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws JsonProcessingException, ParseException {

		System.out.println("sdate========" + startDate);
		System.out.println("edate========" + endDate);

		List<Fees> list = this.feesService.filterFeesByDate(startDate, endDate);

		JSONArray feesArray = new JSONArray();
		for (Fees fees : list) {
			JSONObject feesObject = new JSONObject();
			feesObject.put("date", fees.getDate());
			feesObject.put("payMode", fees.getPayMode());
			feesObject.put("feesAmount", fees.getFeesAmount());

			JSONArray studEntryArray = new JSONArray();

			JSONObject studEntryObject = new JSONObject();
			studEntryObject.put("firstName", fees.getStudentEntry().getFirstName());
			studEntryObject.put("middleName", fees.getStudentEntry().getMiddleName());
			studEntryObject.put("lastName", fees.getStudentEntry().getLastName());
			studEntryObject.put("feesAmount", fees.getStudentEntry().getFeesAmount());
			studEntryObject.put("paidFees", fees.getStudentEntry().getPaidFees());
			studEntryObject.put("discount", fees.getStudentEntry().getDiscount());
			studEntryObject.put("balanceFees", fees.getStudentEntry().getBalanceFees());
			studEntryObject.put("payStatus", fees.getStudentEntry().getPayStatus());

			studEntryArray.add(studEntryObject);

			JSONObject collegeObject = new JSONObject();
			collegeObject.put("collegeName", fees.getStudentEntry().getCollege().getCollegeName());

			JSONObject departmentObject = new JSONObject();
			departmentObject.put("departmentName", fees.getStudentEntry().getDepartment().getDepartmentName());

			studEntryObject.put("college", collegeObject);
			studEntryObject.put("department", departmentObject);
			feesObject.put("studentEntry", studEntryArray);

			feesArray.add(feesObject);
			// System.out.println("Json ======>> " + feesArray);
		}
		System.out.println("Json ======>> " + feesArray);
		return feesArray;
	}

	/* AJAX CALL FOR SEARCH BY YEAR */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/fees/summary/filter/year", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public @ResponseBody JSONObject filterStudentListByYear(@RequestParam("year") String year)
			throws JsonProcessingException, ParseException {

		System.out.println("year========" + year);

		FinancialYear financialYear = this.financialYearService.searchByYear(year);

		JSONObject fyObject = new JSONObject();
		JSONArray studEntryArray = new JSONArray();

		for (StudentEntry studentEntry : financialYear.getStudentEntry()) {
			JSONObject studEntryObject = new JSONObject();

			studEntryObject.put("firstName", studentEntry.getFirstName());
			studEntryObject.put("middleName", studentEntry.getMiddleName());
			studEntryObject.put("lastName", studentEntry.getLastName());
			studEntryObject.put("feesAmount", studentEntry.getFeesAmount());
			studEntryObject.put("paidFees", studentEntry.getPaidFees());
			studEntryObject.put("discount", studentEntry.getDiscount());
			studEntryObject.put("balanceFees", studentEntry.getBalanceFees());
			studEntryObject.put("payStatus", studentEntry.getPayStatus());
			studEntryArray.add(studEntryObject);

			JSONObject collegeObject = new JSONObject();
			collegeObject.put("collegeName", studentEntry.getCollege().getCollegeName());

			JSONObject departmentObject = new JSONObject();
			departmentObject.put("departmentName", studentEntry.getDepartment().getDepartmentName());

			JSONArray feesArray = new JSONArray();

			for (Fees fees : studentEntry.getFees()) {
				JSONObject feesObject = new JSONObject();
				feesObject.put("date", fees.getDate());
				feesObject.put("payMode", fees.getPayMode());
				feesObject.put("feesAmount", fees.getFeesAmount());
				feesArray.add(feesObject);
			}

			studEntryObject.put("college", collegeObject);
			studEntryObject.put("department", departmentObject);
			studEntryObject.put("fees", feesArray);

			fyObject.put("studentEntry", studEntryArray);

		}

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
