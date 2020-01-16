/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iceico.internship.exceptions.ResourceNotFoundException;
import com.iceico.internship.model.FinancialYear;
import com.iceico.internship.service.FeesService;
import com.iceico.internship.service.FinancialYearService;
import com.iceico.internship.service.StudentEntryService;

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

	@Autowired
	private FinancialYearService financialYearService;

	@Autowired
	private StudentEntryService studentEntryService;

	@Autowired
	private FeesService feesService;

	@RequestMapping("/admin/dashboard")
	public String adminDashboard(ModelMap modelMap, Locale locale) throws ResourceNotFoundException, ParseException {

		Date date = new Date();

		FinancialYear financialYear = this.financialYearService.getActiveFinancialYear();
		System.out.println("fy===============" + financialYear);
		System.out.println("==================" + financialYear.getStudentEntry());
		if (financialYear.getStudentEntry() == null) {
			System.out.println("===============================");
			if (financialYear.getStudentEntry().isEmpty()) {
				System.out.println("===============");
//				modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
			}
		} else {
			modelMap.addAttribute("studentEntryList", financialYear.getStudentEntry());
		}
		modelMap.addAttribute("incomeCount", studentEntryService.getTotalIncome());
		modelMap.addAttribute("balanceCount", studentEntryService.getTotalBalance());
		modelMap.addAttribute("paidAmountCount", studentEntryService.getTotalPaidAmount());
		modelMap.addAttribute("dailyFeesCollection", feesService.getdailyFeesCollection(date));
		
		/*
		 * Calendar calendar = Calendar.getInstance(); for(int i=1; i<6; i++) {
		 * calendar.add(Calendar.DATE, -1);
		 * modelMap.addAttribute("dailyFeesCollection"+i,
		 * feesService.getdailyFeesCollection(calendar.getTime())); }
		 * 
		 * modelMap.addAttribute("", feesService.getdailyFeesCollection(date));
		 */

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
