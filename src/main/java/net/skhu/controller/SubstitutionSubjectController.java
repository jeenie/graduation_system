package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.SubjectMapper;
import net.skhu.mapper.SubstitutionSubjectMapper;

@Controller
@RequestMapping("/graduation")
public class SubstitutionSubjectController {
	@Autowired DepartmentMapper departmentMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired SubstitutionSubjectMapper substitutionSubjectMapper;
	
	@RequestMapping("SubstitutionSubject")
	public String list(Model model) {
		SubstitutionSubject substitutionSubject = new SubstitutionSubject();
		List<SubstitutionSubject> substitutionSubjectList = substitutionSubjectMapper.findAll();
		model.addAttribute("substitutionSubjectList", substitutionSubjectList);
		model.addAttribute("substitutionSubject", substitutionSubject);
		model.addAttribute("departments", departmentMapper.findAll());
		return "admin/substituteSubject";
	}
	
	/*
	@RequestMapping(value="SubstitutionSubject", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="ss", required=false) String ss, @RequestParam(value="st", required=false) String st) {
		if(ss == "0")
			model.addAttribute("subjects", subjectMapper.findById(st));
		else if(ss == "1")
			model.addAttribute("subjects", subjectMapper.findBYName(st));
		return "admin/substituteSubject";
	}
	*/
	@RequestMapping(value="findSubject", method=RequestMethod.GET)
	public String searchSubject(Model model, @RequestParam(value="subject", required=false) String subject) {
		List<SubstitutionSubject> subjects = substitutionSubjectMapper.findBySubject(subject);
		model.addAttribute("subject", subject);
		model.addAttribute("substitutionSubjectList", subjects);
		
		return "admin/substituteSubject";
	}
}
