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
import net.skhu.dto.Total;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.TotalMapper;

@Controller
public class GraduationRuleController {
	@Autowired DepartmentMapper departmentMapper;
	@Autowired DepartmentMajorRuleMapper departmentMajorRuleMapper;
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

	@RequestMapping(value="graduation/graduationRule", method = RequestMethod.GET)
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
		return "graduation/graduationRule";
	}
}
