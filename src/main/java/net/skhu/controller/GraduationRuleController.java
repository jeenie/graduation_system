package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Department;
import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.RequiredCultureSubject;
import net.skhu.dto.Total;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.RequiredCultureCountMapper;
import net.skhu.mapper.RequiredCultureSubjectMapper;
import net.skhu.mapper.TotalMapper;

@Controller
public class GraduationRuleController {
	@Autowired DepartmentMapper departmentMapper;
	@Autowired DepartmentMajorRuleMapper departmentMajorRuleMapper;
	@Autowired RequiredCultureCountMapper requiredCultureCountMapper;
	@Autowired RequiredCultureSubjectMapper requiredCultureSubjectMapper;
	@Autowired TotalMapper totalMapper;
	
	@RequestMapping("guest/graduationRule")
	public String viewGuest(Model model) {
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		return "guest/graduationRule";
	}
	
	@RequestMapping(value= "guest/graduationRule", method = RequestMethod.GET)
	public String viewGuest(Model model, @RequestParam("departmentId") int departmentId, @RequestParam("entranceYear") int entranceYear) {
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId, entranceYear);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("total", totalGrade);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		return "guest/graduationRule";
	}

	@RequestMapping("user/graduationRule")
	public String viewUser(Model model) {
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		return "user/graduationRule";
	}
	
	@RequestMapping(value="user/graduationRule", method = RequestMethod.GET)
	public String viewUser(Model model, @RequestParam("departmentId") int departmentId, @RequestParam("entranceYear") int entranceYear) {
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId, entranceYear);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("total", totalGrade);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		return "user/graduationRule";
	}
	
	@RequestMapping(value="graduation/deptRuleEdit", method = RequestMethod.GET)
	public String choice(Model model, @RequestParam("departmentId") int departmentId, @RequestParam("entranceYear") int entranceYear) {
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId, entranceYear);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		return "admin/departmentRuleEdit";
	}
	
	@RequestMapping(value="graduation/deptRuleEdit", method = RequestMethod.POST)
	public String edit(Model model, List<DepartmentMajorRule> departmentMajorRules) {
		departmentMajorRuleMapper.updateList(departmentMajorRules);
		return "admin/departmentRuleEdit";
	}
	
	@RequestMapping("graduation/culturalSubject")
	public String culturalSubject(Model model) {
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(2016);
		List<RequiredCultureSubject> requiredCultureSubjects2018 = requiredCultureSubjectMapper.findByYear(2018);
		model.addAttribute("requiredCultureCount", requiredCultureCount);
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("requiredCultureSubjects2018", requiredCultureSubjects2018);
		return "admin/culturalSubject";
	}
	
	@RequestMapping(value="graduation/culturalSubject", method=RequestMethod.POST)
	public String editCultural(Model model, RequiredCultureCount requiredCultureCount) {
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(2016);
		List<RequiredCultureSubject> requiredCultureSubjects2018 = requiredCultureSubjectMapper.findByYear(2018);
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("requiredCultureSubjects2018", requiredCultureSubjects2018);
		requiredCultureCountMapper.update(requiredCultureCount);
		return "admin/culturalSubject";
	}
}
