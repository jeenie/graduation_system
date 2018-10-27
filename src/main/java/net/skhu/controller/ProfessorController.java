package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.dto.Professor;
import net.skhu.mapper.ProfessorMapper;

@Controller
@RequestMapping("/user")
public class ProfessorController {
	@Autowired ProfessorMapper professorMapper;

	@RequestMapping("professorInquiry")
	public String list(Model model) {
		List<Professor> professors = professorMapper.findAll();
		model.addAttribute("professors", professors);
		return "graduation/professorInquiry";
	}


}
