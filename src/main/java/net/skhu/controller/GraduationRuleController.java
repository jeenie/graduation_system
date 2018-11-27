package net.skhu.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.skhu.dto.Department;
import net.skhu.dto.DepartmentCulture;
import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Major;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.RequiredCultureSubject;
import net.skhu.dto.Total;
import net.skhu.dto.Year;
import net.skhu.mapper.DepartmentCultureMapper;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MajorMapper;
import net.skhu.mapper.RequiredCultureCountMapper;
import net.skhu.mapper.RequiredCultureSubjectMapper;
import net.skhu.mapper.TotalMapper;
import net.skhu.mapper.YearMapper;

@Controller
public class GraduationRuleController {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	MajorMapper majorMapper;
	@Autowired
	DepartmentMajorRuleMapper departmentMajorRuleMapper;
	@Autowired
	DepartmentCultureMapper departmentCultureMapper;
	@Autowired
	RequiredCultureCountMapper requiredCultureCountMapper;
	@Autowired
	RequiredCultureSubjectMapper requiredCultureSubjectMapper;
	@Autowired
	TotalMapper totalMapper;
	@Autowired
	YearMapper yearMapper;
	
	JSONParser parser = new JSONParser();

	@RequestMapping("guest/graduationRule")
	public String viewGuest(Model model) {
		List<Department> departments = departmentMapper.findRealDept();
		List<Year> years = yearMapper.years();
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		model.addAttribute("departments", departments);
		model.addAttribute("chapelCount", requiredCultureCount.getChapelCount());
		model.addAttribute("serveCount", requiredCultureCount.getServeCount());
		model.addAttribute("total", totalGrade);
		model.addAttribute("years", years);
		return "guest/graduationRule_first";
	}

	@RequestMapping(value = "guest/select", method = RequestMethod.GET)
	public String viewGuest(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) {
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		DepartmentMajorRule firstRule = null;
		if (departmentId == 31)
			firstRule = departmentMajorRuleMapper.findSecond(departmentId, entranceYear);
		else
			firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<DepartmentCulture> departmentCultures = departmentCultureMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<Major> majors = null;
		if (departmentId == 32)
			if (entranceYear <= 2013)
				majors = majorMapper.findSoft2013MustMajor(departmentId);
			else
				majors = majorMapper.findSoft2014MustMajor(departmentId);
		else
			majors = majorMapper.findMustMajor(departmentId);
		List<Department> departments = departmentMapper.findRealDept();
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(entranceYear);
		List<Year> years = yearMapper.years();
		
		
		model.addAttribute("departments", departments);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("total", totalGrade);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		model.addAttribute("majors", majors);
		model.addAttribute("departmentCultures", departmentCultures);
		model.addAttribute("chapelCount", requiredCultureCount.getChapelCount());
		model.addAttribute("serveCount", requiredCultureCount.getServeCount());
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("years", years);
		return "guest/graduationRule";
	}
	

	@RequestMapping("user/graduationRule")
	public String viewUser(Model model) {
		List<Department> departments = departmentMapper.findRealDept();
		List<Year> years = yearMapper.years();
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		model.addAttribute("departments", departments);
		model.addAttribute("chapelCount", requiredCultureCount.getChapelCount());
		model.addAttribute("serveCount", requiredCultureCount.getServeCount());
		model.addAttribute("total", totalGrade);
		model.addAttribute("years", years);
		return "user/graduationRule";
	}

	@RequestMapping(value = "user/select", method = RequestMethod.GET)
	public String viewUser(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) {
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		DepartmentMajorRule firstRule = null;
		if (departmentId == 31)
			firstRule = departmentMajorRuleMapper.findSecond(departmentId, entranceYear);
		else
			firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<DepartmentCulture> departmentCultures = departmentCultureMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<Major> majors = null;
		if (departmentId == 32)
			if (entranceYear <= 2013)
				majors = majorMapper.findSoft2013MustMajor(departmentId);
			else
				majors = majorMapper.findSoft2014MustMajor(departmentId);
		else
			majors = majorMapper.findMustMajor(departmentId);
		List<Department> departments = departmentMapper.findRealDept();
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(entranceYear);
		List<Year> years = yearMapper.years();
		
		
		model.addAttribute("departments", departments);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("total", totalGrade);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		model.addAttribute("majors", majors);
		model.addAttribute("departmentCultures", departmentCultures);
		model.addAttribute("chapelCount", requiredCultureCount.getChapelCount());
		model.addAttribute("serveCount", requiredCultureCount.getServeCount());
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("years", years);
		return "user/graduationRule";
	}

	// 학과별 졸업요건 수정
	@RequestMapping(value = "graduation/deptRuleEdit", method = RequestMethod.GET)
	public String choice(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) {
		List<Department> departments = departmentMapper.findRealDept();
		List<Year> years = yearMapper.years();
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<Major> majors = null;
		if (departmentId == 32)
			if (entranceYear <= 2013)
				majors = majorMapper.findSoft2013MustMajor(departmentId);
			else
				majors = majorMapper.findSoft2014MustMajor(departmentId);
		else
			majors = majorMapper.findMustMajor(departmentId);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("departments", departments);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		model.addAttribute("majors", majors);
		model.addAttribute("years", years);
		return "admin/departmentRuleEdit";
	}

	@RequestMapping(value = "graduation/deptRuleEdit", method = RequestMethod.POST)
	public String edit(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear, @RequestParam("mustMajor") int[] mustMajors,
			@RequestParam("choiceMajor") int[] choiceMajors, @RequestParam("mustPlusChoice") int[] mustPlusChoices) {
		/*
		 * departmentMajorRuleMapper.updateList(departmentMajorRules); return
		 * "admin/departmentRuleEdit";
		 */
		List<Department> departments = departmentMapper.findRealDept();
		List<Year> years = yearMapper.years();
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		List<Major> majors = null;
		if (departmentId == 32)
			if (entranceYear <= 2013)
				majors = majorMapper.findSoft2013MustMajor(departmentId);
			else
				majors = majorMapper.findSoft2014MustMajor(departmentId);
		else
			majors = majorMapper.findMustMajor(departmentId);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("departments", departments);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		model.addAttribute("majors", majors);
		model.addAttribute("years", years);
		
		List<DepartmentMajorRule> rules = new ArrayList<DepartmentMajorRule>();
		DepartmentMajorRule rule = new DepartmentMajorRule();
		System.out.println(mustMajors.length);
		for (int i = 0; i < mustMajors.length; i++) {
			System.out.println("목록시작" + i);
			rule.setDepartmentId(departmentId);
			System.out.println(rule.getDepartmentId());
			rule.setEntranceYear(i + 1 == 1 || i + 1 == 2 ? entranceYear : 0);
			System.out.println(rule.getEntranceYear());
			rule.setProcessId(i + 1);
			System.out.println(rule.getProcessId());
			rule.setMustMajor(mustMajors[i]);
			System.out.println(rule.getMustMajor());
			rule.setChoiceMajor(choiceMajors[i]); System.out.println(rule.getChoiceMajor());
			rule.setMustPlusChoice(mustPlusChoices[i]); System.out.println(rule.getMustPlusChoice());
			rules.add(rule);
		}
		System.out.println(rules.size());
		departmentMajorRuleMapper.updateList(rules);
		return "admin/departmentRuleEdit";
	}

	// 교양 필수 과목 수정
	@RequestMapping("graduation/culturalSubject")
	public String culturalSubject(Model model) {
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(2016);
		List<RequiredCultureSubject> requiredCultureSubjects2018 = requiredCultureSubjectMapper.findByYear(2018);
		RequiredCultureSubject cultureMust = new RequiredCultureSubject();
		model.addAttribute("requiredCultureCount", requiredCultureCount);
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("requiredCultureSubjects2018", requiredCultureSubjects2018);
		model.addAttribute("cultureMust", cultureMust);
		return "admin/culturalSubject";
	}

	@RequestMapping(value = "graduation/culturalSubject", method = RequestMethod.POST)
	public String editCultural(Model model, RequiredCultureCount requiredCultureCount) {
		List<RequiredCultureSubject> requiredCultureSubjects = requiredCultureSubjectMapper.findByYear(2016);
		List<RequiredCultureSubject> requiredCultureSubjects2018 = requiredCultureSubjectMapper.findByYear(2018);
		RequiredCultureSubject cultureMust = new RequiredCultureSubject();
		model.addAttribute("requiredCultureSubjects", requiredCultureSubjects);
		model.addAttribute("requiredCultureSubjects2018", requiredCultureSubjects2018);
		model.addAttribute("cultureMust", cultureMust);
		requiredCultureCountMapper.update(requiredCultureCount);
		return "admin/culturalSubject";
	}

	@RequestMapping(value = "graduation/addSubject1617", method = RequestMethod.POST)
	public String addSubject1617(Model model, RequiredCultureSubject cultureMust) {
		requiredCultureSubjectMapper.insert2016(cultureMust);
		requiredCultureSubjectMapper.insert2017(cultureMust);
		return "redirect:culturalSubject";
	}

	@RequestMapping(value = "graduation/addSubject18", method = RequestMethod.POST)
	public String addSubject18(Model model, RequiredCultureSubject cultureMust) {
		requiredCultureSubjectMapper.insert2018(cultureMust);
		return "redirect:culturalSubject";
	}

	@RequestMapping(value = "graduation/deleteMajor", method = RequestMethod.GET)
	public String deleteMajor(Model model, @RequestParam("departmentId") int departmentId, @RequestParam("majorSubjectId") String majorSubjectId,
			@RequestParam("entranceYear") int entranceYear) {
		majorMapper.delete(departmentId, majorSubjectId, entranceYear);
		return "redirect:deptRuleEdit?departmentId=" + departmentId + "&entranceYear=" + entranceYear;
	}
	
	@RequestMapping(value = "graduation/deleteCulture", method = RequestMethod.GET)
	public String deleteCulture(Model model, @RequestParam("subjectId") String subjectId,
			@RequestParam("entranceYear") int entranceYear) {
		requiredCultureSubjectMapper.delete(subjectId, entranceYear);
		return "redirect:culturalSubject";
	}
	
	

}
