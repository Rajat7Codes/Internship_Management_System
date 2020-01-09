/**
 * 
 */
package com.iceico.internship.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
import com.iceico.internship.model.InternshipSession;
import com.iceico.internship.model.StudentEntry;
import com.iceico.internship.service.CollegeService;
import com.iceico.internship.service.DepartmentService;
import com.iceico.internship.service.FinancialYearService;
import com.iceico.internship.service.HolidayService;
import com.iceico.internship.service.InternshipDurationService;
import com.iceico.internship.service.InternshipSessionService;
import com.iceico.internship.service.InternshipTypeService;
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
public class StudentEntryController {

	/**
	 * 
	 */
	public StudentEntryController() {
	}

	@Autowired
	private StudentEntryService studentEntryService;

	@Autowired
	private InternshipTypeService internshipTypeService;

	@Autowired
	private InternshipDurationService internshipDurationService;

	@Autowired
	private InternshipSessionService internshipSessionService;

	@Autowired
	private FinancialYearService financialYearService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private CollegeService collegeService;

	@Autowired
	private HolidayService holidayService;

	@Autowired
	private ListHelper listHelper;

	@GetMapping("/admin/student/entry/new")
	public String getStudentEntry(ModelMap modelMap, Locale locale) {
		StudentEntry studentEntry = new StudentEntry();
		studentEntry.setFinancialYear(this.financialYearService.getActiveFinancialYear());

		modelMap.addAttribute("studentEntry", studentEntry);
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("statusList", this.listHelper.getStatusList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "newStudentEntry";
	}

	@GetMapping("/admin/student/entry")
	public String newStudentEntry(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "studentEntry";
	}

	@PostMapping("/admin/student/entry/save")
	public String saveExpenses(@ModelAttribute("studentEntry") @Valid StudentEntry studentEntry,
			BindingResult bindingResult, ModelMap modelMap, Locale locale) {

		if (bindingResult.hasErrors()) {
			modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
			modelMap.addAttribute("user", this.getPrincipal());

			return "studentEntry";
		} else {
			Double fees = studentEntry.getFeesAmount();
			Double discount = studentEntry.getDiscount();

			String status = "UnPaid";

			fees = fees - discount;
			System.out.println("calculated fees =====>" + fees);
			Double paid = 0d;
			Double balFees = (fees - paid);

			studentEntry.setPaidFees(paid);
			studentEntry.setBalanceFees(balFees);
			studentEntry.setPayStatus(status);

			this.studentEntryService.saveStudentEntry(studentEntry);
			modelMap.addAttribute("user", this.getPrincipal());
			return "redirect:/admin/student/entry";
		}
	}

	@GetMapping("/admin/student/entry/edit/{studentEntryId}")
	public String editStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("statusList", this.listHelper.getStatusList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "newStudentEntry";
	}

	@GetMapping("/admin/student/entry/view/{studentEntryId}")
	public String viewStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("statusList", this.listHelper.getStatusList());
		modelMap.addAttribute("user", this.getPrincipal());

		return "viewStudentEntry";
	}

	@GetMapping("/admin/student/entry/delete/{studentEntryId}")
	public String deleteStudentEntry(@PathVariable("studentEntryId") @Valid Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException {
		this.studentEntryService.deleteStudentEntry(studentEntryId);
		return "redirect:/admin/student/entry";
	}

	/* certification */
	@GetMapping("/admin/student/entry/joining/letter/{studentEntryId}")
	public String getJoiningLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException, Exception {

		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		Date date = studentEntry.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String stDate = simpleDateFormat.format(date);

		Integer joinStatus = studentEntry.getJoinCount();
		if (joinStatus == null) {
			studentEntry.setJoinCount(1);
			modelMap.addAttribute("offer", true);
			modelMap.addAttribute("joiningDate", stDate);
			modelMap.addAttribute("stud", this.studentEntryService.getStudentEntryById(studentEntryId));
		} else {
			modelMap.addAttribute("offer", false);
			modelMap.addAttribute("errorMessage", "Joining Letter Already Given ");
		}

		/*
		 * modelMap.addAttribute("offer", true);
		 * modelMap.addAttribute("joiningDateInStandardFormat", stDate);
		 * modelMap.addAttribute("stud",
		 * this.studentEntryService.getStudentEntryById(studentEntryId));
		 */
		modelMap.addAttribute("user", this.getPrincipal());
		return "joiningLetter";
	}

	@GetMapping("/admin/student/entry/offer/letter/{studentEntryId}")
	public String getOfferLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException, ParseException {
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);

		Integer offerStatus = studentEntry.getOfferCount();
		if (offerStatus == null) {
			studentEntry.setOfferCount(1);
			List<Holiday> holidayList = this.holidayService.getHolidayList();

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");

			// Gets Joining Date from Database
			modelMap.addAttribute("joiningDate", simpleDateFormat.format(studentEntry.getDate()));

			Calendar calendar = Calendar.getInstance();

			// Generates Current Date
			modelMap.addAttribute("currentDate", simpleDateFormat.format(calendar.getTime()).toString());

			// Checks for Holiday after 15 days
			calendar.add(Calendar.DATE, 15);
			for (int i = 0; i < holidayList.size(); i++) {
				String stDate = simpleDateFormat.format(holidayList.get(i).getDate());
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(simpleDateFormat.parse(stDate));
				if (simpleDateFormat.format(calendar.getTime()).toString()
						.equals(simpleDateFormat.format(calendar1.getTime()).toString())) {
					calendar.add(Calendar.DATE, 1);
					i = 0;
				}
			}

			modelMap.addAttribute("reportingDate", simpleDateFormat.format(calendar.getTime()).toString());
			modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
			modelMap.addAttribute("stud", studentEntry);
			modelMap.addAttribute("offer", true);
		} else {
			modelMap.addAttribute("offer", false);
			modelMap.addAttribute("errorMessage", "Offer Letter Already Given ");
		}

		modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
		modelMap.addAttribute("stud", studentEntry);
		modelMap.addAttribute("user", this.getPrincipal());
		return "offerLetter";
	}

	@GetMapping("/admin/student/entry/internship/certificate/{studentEntryId}")
	public String getInternshipCertificate(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException, ParseException {
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);

		Integer internshipStatus = studentEntry.getInternshipCount();
		if (internshipStatus == null) {
			studentEntry.setInternshipCount(1);

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");

			Calendar calendar = Calendar.getInstance();

			// Generates Current Date
			modelMap.addAttribute("currentDate", simpleDateFormat.format(calendar.getTime()).toString());

			modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
			modelMap.addAttribute("stud", studentEntry);
			modelMap.addAttribute("collegeName", studentEntry.getCollege().getCollegeName());
			modelMap.addAttribute("offer", true);

			// Get internship session(start date & end date from database)

			modelMap.addAttribute("startDate",
					simpleDateFormat.format(studentEntry.getInternshipSession().getStartDate()));
			modelMap.addAttribute("endDate", simpleDateFormat.format(studentEntry.getInternshipSession().getEndDate()));
		} else {
			modelMap.addAttribute("offer", false);
			modelMap.addAttribute("errorMessage", "Internship Certificate Already Given ");
		}

		modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
		/* modelMap.addAttribute("stud", studentEntry); */
		modelMap.addAttribute("stud", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("user", this.getPrincipal());
		return "internshipCertificate";
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
