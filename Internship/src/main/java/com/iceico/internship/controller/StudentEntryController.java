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
	public String newStudentEntry(ModelMap modelMap, Locale locale) {
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
		modelMap.addAttribute("edit", false);
		modelMap.addAttribute("user", this.getPrincipal());
		return "newStudentEntry";
	}

	@GetMapping("/admin/student/entry")
	public String getStudentEntry(ModelMap modelMap, Locale locale) {
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
			// System.out.println("calculated fees =====>" + fees);
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

		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		String type = studentEntry.getInternshipType().getType();
		System.out.println("type ====>>" + studentEntry.getInternshipType().getType());
		System.out.println("type====>" + type);
		modelMap.addAttribute("studentEntry", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
		modelMap.addAttribute("internTypeList", this.internshipTypeService.getInternshipTypeList());
		modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
		modelMap.addAttribute("internDurList", this.internshipDurationService.getInternshipDurationList());
		modelMap.addAttribute("fyList", this.financialYearService.getFinancialYearList());
		modelMap.addAttribute("departmentList", this.departmentService.getDepartmentList());
		modelMap.addAttribute("statusList", this.listHelper.getStatusList());
		modelMap.addAttribute("edit", true);

		if (type.equalsIgnoreCase("paid")) {
			System.out.println("inside paid type if type   =============<<<<<< ");
			modelMap.addAttribute("paidType", type);
		} else {
			System.out.println("inside Free type   ================<<<<<<");
			modelMap.addAttribute("freeType", type);
		}
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

	@GetMapping("/admin/student/entry/certifcates")
	public String studentEntry(ModelMap modelMap, Locale locale) {
		modelMap.addAttribute("studentEntryList", this.studentEntryService.getStudentEntryList());
		modelMap.addAttribute("user", this.getPrincipal());
		return "studentEntryCertificates";
	}

	/* certification */
	@GetMapping("/admin/student/entry/joining/letter/print/{studentEntryId}")
	public String getJoiningLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException, Exception {

		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		Date date = studentEntry.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		modelMap.addAttribute("joiningDate", simpleDateFormat.format(date));

		String stDate = simpleDateFormat.format(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(simpleDateFormat.parse(stDate));
		calendar.add(Calendar.DATE, 15);
		stDate = simpleDateFormat.format(calendar.getTime());
		// System.out.println("15days later date ====>>" + stDate);
		Date newDate = simpleDateFormat.parse(stDate);
		SimpleDateFormat newSimpleDateFormat = new SimpleDateFormat("EEEE");
		String day = newSimpleDateFormat.format(newDate); // for check which day comes on 15 days later
		List<Holiday> holidayList = this.holidayService.getHolidayList();
		Integer joinStatus = studentEntry.getJoinCount();

		if (joinStatus == null) {
			studentEntry.setJoinCount(1);
			this.studentEntryService.saveStudentEntry(studentEntry);
			modelMap.addAttribute("offer", true);

			if (holidayList.isEmpty()) {
				if (day.equalsIgnoreCase("sunday")) {
					calendar.add(Calendar.DATE, 1);
					stDate = simpleDateFormat.format(calendar.getTime());
					modelMap.addAttribute("date", stDate);
				}
			}
			for (int i = 0; i < holidayList.size(); i++) {
				String stDate1 = simpleDateFormat.format(holidayList.get(i).getDate());
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(simpleDateFormat.parse(stDate1));
				if (simpleDateFormat.format(calendar.getTime()).toString().equals(
						simpleDateFormat.format(calendar1.getTime()).toString()) || day.equalsIgnoreCase("sunday")) {
					if (simpleDateFormat.format(calendar.getTime()).toString()
							.equals(simpleDateFormat.format(calendar1.getTime()).toString())) {
						calendar.add(Calendar.DATE, 1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("date", stDate);
						i = 0;
					}
					Date newDate1 = simpleDateFormat.parse(stDate);
					SimpleDateFormat newSimpleDateFormat1 = new SimpleDateFormat("EEEE");
					String day1 = newSimpleDateFormat1.format(newDate1);
					if (day1.equalsIgnoreCase("sunday")) {
						calendar.add(Calendar.DATE, 1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("date", stDate);
					}
				}
			}
		} else {
			modelMap.addAttribute("offer", false);
			modelMap.addAttribute("errorMessage", "Offer Letter Already Given ");
		}
		modelMap.addAttribute("date", stDate);
		modelMap.addAttribute("user", this.getPrincipal());
		modelMap.addAttribute("stud", studentEntry);

		return "printJoiningLetter";
	}

	@GetMapping("/admin/student/entry/offer/letter/print/{studentEntryId}")
	public String getOfferLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException, ParseException {
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		Date date = studentEntry.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		modelMap.addAttribute("joiningDate", simpleDateFormat.format(date));

		String stDate = simpleDateFormat.format(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(simpleDateFormat.parse(stDate));
		calendar.add(Calendar.DATE, -1);
		stDate = simpleDateFormat.format(calendar.getTime());
		System.out.println("15days later date ====>>" + stDate);
		Date newDate = simpleDateFormat.parse(stDate);
		SimpleDateFormat newSimpleDateFormat = new SimpleDateFormat("EEEE");
		String day = newSimpleDateFormat.format(newDate); // for check which day comes on 15 days later
		List<Holiday> holidayList = this.holidayService.getHolidayList();
		Integer offerStatus = studentEntry.getOfferCount();

		if (offerStatus == null) {
			studentEntry.setJoinCount(1);
			this.studentEntryService.saveStudentEntry(studentEntry);
			modelMap.addAttribute("offer", true);

			if (holidayList.isEmpty()) {
				if (day.equalsIgnoreCase("sunday")) {
					calendar.add(Calendar.DATE, -1);
					stDate = simpleDateFormat.format(calendar.getTime());
					modelMap.addAttribute("date", stDate);
				}
			}
			for (int i = 0; i < holidayList.size(); i++) {
				System.out.println("inside for");
				String stDate1 = simpleDateFormat.format(holidayList.get(i).getDate());
				System.out.println("holidays dates ====>" + stDate1);
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(simpleDateFormat.parse(stDate1));

				if (simpleDateFormat.format(calendar.getTime()).toString().equals(
						simpleDateFormat.format(calendar1.getTime()).toString()) || day.equalsIgnoreCase("sunday")) {

					if (simpleDateFormat.format(calendar.getTime()).toString()
							.equals(simpleDateFormat.format(calendar1.getTime()).toString())) {
						System.out.println("inside holiday block ======>>>>");
						calendar.add(Calendar.DATE, -1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("date", stDate);
						i = 0;
					}

					Date newDate1 = simpleDateFormat.parse(stDate);
					SimpleDateFormat newSimpleDateFormat1 = new SimpleDateFormat("EEEE");
					String day1 = newSimpleDateFormat1.format(newDate1);
					System.out.println("before date ====>>" + stDate);

					if (day1.equalsIgnoreCase("sunday")) {
						calendar.add(Calendar.DATE, -1);
						stDate = simpleDateFormat.format(calendar.getTime());
						System.out.println("sunday before date ====>>" + stDate);
						modelMap.addAttribute("date", stDate);
					}
				}
			}
		} else {
			modelMap.addAttribute("offer", false);
			modelMap.addAttribute("errorMessage", "Offer Letter Already Given ");
		}
		modelMap.addAttribute("date", stDate);
		modelMap.addAttribute("user", this.getPrincipal());
		modelMap.addAttribute("stud", studentEntry);
		return "printOfferLetter";
	}

	@GetMapping("/admin/student/entry/internship/certificate/print/{studentEntryId}")
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
		return "printInternshipCertificate";
	}

	@GetMapping("/admin/student/entry/joining/letter/view/{studentEntryId}")
	public String viewJoiningLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException, Exception {

		System.out.println("==========>>>>>inside view joining letter controller<<<<<=============");
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		Date date = studentEntry.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		modelMap.addAttribute("joiningDate", simpleDateFormat.format(date));

		String stDate = simpleDateFormat.format(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(simpleDateFormat.parse(stDate));
		calendar.add(Calendar.DATE, 15);
		stDate = simpleDateFormat.format(calendar.getTime());
		// System.out.println("15days later date ====>>" + stDate);
		Date newDate = simpleDateFormat.parse(stDate);
		SimpleDateFormat newSimpleDateFormat = new SimpleDateFormat("EEEE");
		String day = newSimpleDateFormat.format(newDate); // for check which day comes on 15 days later
		List<Holiday> holidayList = this.holidayService.getHolidayList();

		if (holidayList.isEmpty()) {
			if (day.equalsIgnoreCase("sunday")) {
				calendar.add(Calendar.DATE, 1);
				stDate = simpleDateFormat.format(calendar.getTime());
				modelMap.addAttribute("date", stDate);
			}
		} else {
			for (int i = 0; i < holidayList.size(); i++) {
				String stDate1 = simpleDateFormat.format(holidayList.get(i).getDate());
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(simpleDateFormat.parse(stDate1));

				if (simpleDateFormat.format(calendar.getTime()).toString().equals(
						simpleDateFormat.format(calendar1.getTime()).toString()) || day.equalsIgnoreCase("sunday")) {
					if (simpleDateFormat.format(calendar.getTime()).toString()
							.equals(simpleDateFormat.format(calendar1.getTime()).toString())) {
						calendar.add(Calendar.DATE, 1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("date", stDate);
						i = 0;
					}
					Date newDate1 = simpleDateFormat.parse(stDate);
					SimpleDateFormat newSimpleDateFormat1 = new SimpleDateFormat("EEEE");
					String day1 = newSimpleDateFormat1.format(newDate1);
					if (day1.equalsIgnoreCase("sunday")) {
						calendar.add(Calendar.DATE, 1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("date", stDate);
					}
				}
			}
		}
		modelMap.addAttribute("date", stDate);
		modelMap.addAttribute("user", this.getPrincipal());
		modelMap.addAttribute("stud", studentEntry);
		return "viewJoiningLetter";
	}

	@GetMapping("/admin/student/entry/offer/letter/view/{studentEntryId}")
	public String viewOfferLetter(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap, Locale locale)
			throws ResourceNotFoundException, ParseException {
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		Date date = studentEntry.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		modelMap.addAttribute("joiningDate", simpleDateFormat.format(date));
		String stDate = simpleDateFormat.format(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(simpleDateFormat.parse(stDate));
		calendar.add(Calendar.DATE, -1);
		stDate = simpleDateFormat.format(calendar.getTime());
		Date newDate = simpleDateFormat.parse(stDate);
		SimpleDateFormat newSimpleDateFormat = new SimpleDateFormat("EEEE");
		String day = newSimpleDateFormat.format(newDate); // for check which day comes on 1 day later
		List<Holiday> holidayList = this.holidayService.getHolidayList();

		if (holidayList.isEmpty()) {
			if (day.equalsIgnoreCase("sunday")) {
				calendar.add(Calendar.DATE, -1);
				stDate = simpleDateFormat.format(calendar.getTime());
				modelMap.addAttribute("date", stDate);
			}
		} else {
			for (int i = 0; i < holidayList.size(); i++) {
				String stDate1 = simpleDateFormat.format(holidayList.get(i).getDate());
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(simpleDateFormat.parse(stDate1));
				if (simpleDateFormat.format(calendar.getTime()).toString().equals(
						simpleDateFormat.format(calendar1.getTime()).toString()) || day.equalsIgnoreCase("sunday")) {
					if (simpleDateFormat.format(calendar.getTime()).toString()
							.equals(simpleDateFormat.format(calendar1.getTime()).toString())) {
						calendar.add(Calendar.DATE, -1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("currentDate", stDate);
						i = 0;
					}
					Date newDate1 = simpleDateFormat.parse(stDate);
					SimpleDateFormat newSimpleDateFormat1 = new SimpleDateFormat("EEEE");
					String day1 = newSimpleDateFormat1.format(newDate1);
					if (day1.equalsIgnoreCase("sunday")) {
						calendar.add(Calendar.DATE, -1);
						stDate = simpleDateFormat.format(calendar.getTime());
						modelMap.addAttribute("currentDate", stDate);
					}
				}
			}
		}
		modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
		modelMap.addAttribute("currentDate", stDate);
		modelMap.addAttribute("stud", studentEntry);
		modelMap.addAttribute("user", this.getPrincipal());
		return "viewOfferLetter";
	}

	@GetMapping("/admin/student/entry/internship/certificate/view/{studentEntryId}")
	public String viewInternshipCertificate(@PathVariable("studentEntryId") Long studentEntryId, ModelMap modelMap,
			Locale locale) throws ResourceNotFoundException, ParseException {
		StudentEntry studentEntry = this.studentEntryService.getStudentEntryById(studentEntryId);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Calendar calendar = Calendar.getInstance();
		// Generates Current Date
		modelMap.addAttribute("currentDate", simpleDateFormat.format(calendar.getTime()).toString());
		modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
		modelMap.addAttribute("stud", studentEntry);
		modelMap.addAttribute("collegeName", studentEntry.getCollege().getCollegeName());
		modelMap.addAttribute("offer", true);
		// Get internship session(start date & end date from database)
		modelMap.addAttribute("startDate", simpleDateFormat.format(studentEntry.getInternshipSession().getStartDate()));
		modelMap.addAttribute("endDate", simpleDateFormat.format(studentEntry.getInternshipSession().getEndDate()));
		modelMap.addAttribute("duration", studentEntry.getInternshipDuration().getDuration());
		/* modelMap.addAttribute("stud", studentEntry); */
		modelMap.addAttribute("stud", this.studentEntryService.getStudentEntryById(studentEntryId));
		modelMap.addAttribute("user", this.getPrincipal());
		return "viewInternshipCertificate";
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
