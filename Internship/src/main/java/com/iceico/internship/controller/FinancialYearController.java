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
import com.iceico.internship.model.FinancialYear;
import com.iceico.internship.service.FinancialYearService;

/**
 * @author Sameer Kadagye
 *
 */
@Controller
public class FinancialYearController {

	public FinancialYearController() {

	}

	@Autowired
	private FinancialYearService financialYearService;

	@GetMapping("/admin/financial/year")
	public String getFinancialYear(ModelMap modelMap, Locale locale) {

		modelMap.addAttribute("financialYear", new FinancialYear());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		return "financialYear";
	}

	@PostMapping("/admin/financial/year/save")
	public String saveFinancialYear(@ModelAttribute("financialYear") @Valid FinancialYear financialYear,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {
		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
			modelMap.addAttribute("user", this.getPrincipal());
			return "internshipType";
		} else {

			if (financialYear.getFinancialYearId() == null) {

				this.financialYearService.saveFinancialYear(financialYear);
				modelMap.addAttribute("user", this.getPrincipal());
			} else {
				this.financialYearService.saveFinancialYear(financialYear);
			}
			return "redirect:/admin/financial/year";
		}
	}

	@GetMapping("/admin/financial/year/edit/{financialYearId}")
	public String editInternshipType(@PathVariable("financialYearId") @Valid Long financialYearId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("financialYear", this.financialYearService.getFinancialYearById(financialYearId));
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "financialYear";
	}

	@GetMapping("/admin/financial/year/delete/{financialYearId}")
	public String deleteInternshipType(@PathVariable("financialYearId") @Valid Long financialYearId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		this.financialYearService.deleteFinancialYear(financialYearId);

		modelMap.addAttribute("user", this.getPrincipal());
		return "redirect:/admin/financial/year";
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
