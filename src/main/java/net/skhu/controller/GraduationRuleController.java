package net.skhu.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import net.skhu.dto.Tree;
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
		return "guest/graduationRule";
	}

	@RequestMapping(value = "guest/select", method = RequestMethod.GET)
	public String viewGuest(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) throws FileNotFoundException, IOException, ParseException {
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
		
		//Object obj = parser.parse(new FileReader("C:\\Users\\pc\\spring\\graduation_system\\src\\main\\webapp\\res\\data.json"));
		//JSONObject jsonObject = (JSONObject) obj;
		
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
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("departments", departments);
		return "user/graduationRule";
	}

	@RequestMapping(value = "user/graduationRule", method = RequestMethod.GET)
	public String viewUser(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) {
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("total", totalGrade);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);
		return "user/graduationRule";
	}

	// 학과별 졸업요건 수정
	@RequestMapping(value = "graduation/deptRuleEdit", method = RequestMethod.GET)
	public String choice(Model model, @RequestParam("departmentId") int departmentId,
			@RequestParam("entranceYear") int entranceYear) {
		DepartmentMajorRule firstRule = departmentMajorRuleMapper.findFirst(departmentId, entranceYear);
		List<DepartmentMajorRule> departmentMajorRules = departmentMajorRuleMapper.findByDepartmentId(departmentId,
				entranceYear);
		model.addAttribute("departmentId", departmentId);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("firstRule", firstRule);
		model.addAttribute("departmentMajorRules", departmentMajorRules);

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
		List<DepartmentMajorRule> rules = new ArrayList<DepartmentMajorRule>();
		DepartmentMajorRule rule = new DepartmentMajorRule();
		System.out.println(mustMajors.length);
		for (int i = 0; i < mustMajors.length; i++) {
			rule.setDepartmentId(departmentId);
			rule.setEntranceYear(i + 1 == 1 || i == 2 ? entranceYear : 0);
			rule.setProcessId(i + 1);
			rule.setMustMajor(mustMajors[i]);
			rule.setChoiceMajor(choiceMajors[i]);
			rule.setMustPlusChoice(mustPlusChoices[i]);
			rules.add(rule);
		}
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

	@RequestMapping(value = "graduation/deleteCulture", method = RequestMethod.GET)
	public String deleteCulture(Model model, @RequestParam("subjectId") String subjectId,
			@RequestParam("entranceYear") int entranceYear) {
		requiredCultureSubjectMapper.delete(subjectId, entranceYear);
		return "redirect:culturalSubject";
	}
	
	@RequestMapping(value="guest/exexex", method = RequestMethod.GET)
	public ModelAndView ex()  {
	/*
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject1 = new JSONObject();
		jsonObject1.put("label", "핵심역량");
		jsonObject1.put("itemId", "root");
		jsonObject1.put("parentId", "999");
		jsonObject1.put("order", "1");
		jsonArray.add(jsonObject1);
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("label", "가치역량");
		jsonObject2.put("itemId", "root");
		jsonObject2.put("parentId", "999");
		jsonObject2.put("order", "1");
		jsonArray.add(jsonObject2);
		JSONObject jsonObject3 = new JSONObject();
		jsonObject3.put("label", "인간·인권");
		jsonObject3.put("itemId", "root");
		jsonObject3.put("parentId", "999");
		jsonObject3.put("order", "1");
		jsonArray.add(jsonObject3);
		JSONObject jsonObject4 = new JSONObject();
		jsonObject4.put("label", "생명·평화");
		jsonObject4.put("itemId", "root");
		jsonObject4.put("parentId", "999");
		jsonObject4.put("order", "1");
		jsonArray.add(jsonObject4);
		JSONObject jsonObject5 = new JSONObject();
		jsonObject5.put("label", "민주시민");
		jsonObject5.put("itemId", "root");
		jsonObject5.put("parentId", "999");
		jsonObject5.put("order", "1");
		jsonArray.add(jsonObject5);
		JSONObject jsonObject6 = new JSONObject();
		jsonObject6.put("label", "대안역량");
		jsonObject6.put("itemId", "root");
		jsonObject6.put("parentId", "999");
		jsonObject6.put("order", "1");
		jsonArray.add(jsonObject6);
		JSONObject jsonObject7 = new JSONObject();
		jsonObject7.put("label", "융·복합적 사고");
		jsonObject7.put("itemId", "root");
		jsonObject7.put("parentId", "999");
		jsonObject7.put("order", "1");
		jsonArray.add(jsonObject7);
		JSONObject jsonObject8 = new JSONObject();
		jsonObject8.put("label", "조사·분석·정보활용");
		jsonObject8.put("itemId", "root");
		jsonObject8.put("parentId", "999");
		jsonObject8.put("order", "1");
		jsonArray.add(jsonObject8);
		JSONObject jsonObject9 = new JSONObject();
		jsonObject9.put("label", "대안제시·문제해결");
		jsonObject9.put("itemId", "root");
		jsonObject9.put("parentId", "999");
		jsonObject9.put("order", "1");
		jsonArray.add(jsonObject9);
		JSONObject jsonObject10 = new JSONObject();
		jsonObject10.put("label", "실천역량");
		jsonObject10.put("itemId", "root");
		jsonObject10.put("parentId", "999");
		jsonObject10.put("order", "1");
		jsonArray.add(jsonObject10);
		JSONObject jsonObject11 = new JSONObject();
		jsonObject11.put("label", "민주적 소통");
		jsonObject11.put("itemId", "root");
		jsonObject11.put("parentId", "999");
		jsonObject11.put("order", "1");
		jsonArray.add(jsonObject11);
		JSONObject jsonObject12 = new JSONObject();
		jsonObject12.put("label", "연대와 공동체적 실천");
		jsonObject12.put("itemId", "root");
		jsonObject12.put("parentId", "999");
		jsonObject12.put("order", "1");
		jsonArray.add(jsonObject11);
	
		System.out.println(jsonArray.toJSONString());
	*/
		
		Tree tree1 = new Tree("핵심역량", "root1", "999", "1");
		Tree tree2 = new Tree("가치역량", "role1", "root", "2");
		Tree tree3 = new Tree("인간·인권", "role11", "role1", "3");
		Tree tree4 = new Tree("생명·평화", "role12",   "role1",  "4");
		Tree tree5 = new Tree("민주시민", "role13", "role1", "5");
		Tree tree6 = new Tree("대안역량", "role2", "root",  "6");
		Tree tree7 = new Tree("융·복합적 사고", "role21", "role2", "7");
		Tree tree8 = new Tree("조사·분석·정보활용", "role22", "role2", "8");
		Tree tree9 = new Tree("대안제시·문제해결", "role23", "role2", "9");
		Tree tree10 = new Tree("실천역량", "role3", "root", "10");
		Tree tree11 = new Tree("민주적 소통", "role31", "role3", "11");
		Tree tree12 = new Tree("연대와 공동체적 실천", "role32", "role3", "12");
		List<Tree> trees = new ArrayList<Tree>();
		
		trees.add(tree1);trees.add(tree2);trees.add(tree3);trees.add(tree4);trees.add(tree5);trees.add(tree6);
		trees.add(tree7);trees.add(tree8);trees.add(tree9);trees.add(tree10);trees.add(tree11);trees.add(tree12);
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("guest/ex");
		mv.addObject("json", trees);
		//mv.addObject("jsonObject", jsonObject);
		return mv;
	}

}
