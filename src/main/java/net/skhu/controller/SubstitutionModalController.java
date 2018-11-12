package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Subject;
import net.skhu.service.SubstitutionModalService;

@Controller
public class SubstitutionModalController {
	@Autowired SubstitutionModalService substitutionModalService;
	
	@RequestMapping("graduation/SubstitutionSubject/popup")
	public String subjectList(Model model) {
		
		return "modal/subjectList";
	}
	
	@RequestMapping(value="graduation/SubstitutionSubject/popup", method=RequestMethod.GET)
	public String subjectList(Model model, @RequestParam("ss") String ss, @RequestParam("st") String st) {
		List<Subject> subjects = null;
		if(ss == "0") 
			substitutionModalService.findById(st);
		else if(ss == "1")
			substitutionModalService.findByName(st);
		model.addAttribute("subjects", subjects);
		return "modal/subjectList";
	}
}

