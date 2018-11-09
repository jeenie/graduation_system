package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.SubstitutionSubjectMapper;

@Controller
@RequestMapping("/graduation")
public class SubstitutionSubjectController {
	@Autowired SubstitutionSubjectMapper substitutionSubjectMapper;
	
	@RequestMapping("SubstitutionSubject")
	public String list(Model model) {
		List<SubstitutionSubject> substitutionSubjectList = substitutionSubjectMapper.findAll();
		model.addAttribute("substitutionSubjectList", substitutionSubjectList);
		return "admin/substituteSubject";
	}
	
	@RequestMapping(value="findSubject", method=RequestMethod.GET)
	public String professorSearch(Model model, @RequestParam(value="subject", required=false) String subject) {
		List<SubstitutionSubject> subjects = substitutionSubjectMapper.findBySubject(subject);
		model.addAttribute("subject", subject);
		model.addAttribute("substitutionSubjectList", subjects);
		
		return "admin/substituteSubject";
	}
}
