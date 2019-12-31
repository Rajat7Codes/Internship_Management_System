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
import com.iceico.internship.model.College;
import com.iceico.internship.service.CollegeService;
import com.iceico.internship.service.InternshipSessionService;

/**
 * @author Puja Pokale
 * @version 0.1
 *
 *          Created Date : 28/12/2019
 *
 */
@Controller
public class CollegeController {

public CollegeController() {

}

@Autowired
private CollegeService collegeService;

@Autowired
private InternshipSessionService internshipSessionService;

@GetMapping(value = "/admin/college/new")
public String newCollege(ModelMap modelMap, Locale locale) {
modelMap.addAttribute("college", new College());
modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
modelMap.addAttribute("user", this.getPrincipal());
return "newCollege";
}

@GetMapping(value = "/admin/college")
public String getCollege(ModelMap modelMap, Locale locale) {
modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
modelMap.addAttribute("user", this.getPrincipal());
return "college";
}

@PostMapping("/admin/college/save")
public String saveCollege(@ModelAttribute("college") @Valid College college, BindingResult bindingResult,
ModelMap modelMap, Locale locale) {
if (bindingResult.hasErrors()) {
modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
modelMap.addAttribute("user", this.getPrincipal());
return "newCollege";
} else {
this.collegeService.saveCollege(college);
modelMap.addAttribute("user", this.getPrincipal());
return "redirect:/admin/college";
}
}

@GetMapping("/admin/college/edit/{id}")
public String editCollege(@PathVariable("id") Long id, ModelMap modelMap, Locale locale)
throws ResourceNotFoundException {
modelMap.addAttribute("college", this.collegeService.getCollegeById(id));
modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
modelMap.addAttribute("user", this.getPrincipal());
return "newCollege";
}

@GetMapping("/admin/college/view/{id}")
public String viewCollege(@PathVariable("id") Long id, ModelMap modelMap, Locale locale)
throws ResourceNotFoundException {
modelMap.addAttribute("college", this.collegeService.getCollegeById(id));
modelMap.addAttribute("internSessionList", this.internshipSessionService.getSessionList());
modelMap.addAttribute("collegeList", this.collegeService.getCollegeList());
modelMap.addAttribute("user", this.getPrincipal());
return "viewCollege";
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

