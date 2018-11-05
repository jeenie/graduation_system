package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
