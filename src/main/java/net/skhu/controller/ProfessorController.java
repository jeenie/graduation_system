package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Department;
import net.skhu.dto.Professor;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;

@Controller
@RequestMapping("/user")
public class ProfessorController {
	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	DepartmentMapper departmentMapper;

	@RequestMapping("professorInquiry")
	public String list(Model model) {
		List<Professor> professors = professorMapper.findAll();
		model.addAttribute("professors", professors);
		return "graduation/professorInquiry";
	}

	// 검색 조회
	@RequestMapping(value = "professorInquiry", method = RequestMethod.GET)
	public String professorInquiry(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			@RequestParam(value = "id", required = false, defaultValue = "") Integer id,
			@RequestParam(value = "departmentName", required = false, defaultValue = "") String departmentName) {
		List<Professor> professors = professorMapper.findByInquiry(name, id, departmentName);
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("professors", professors);
		return "graduation/professorInquiry";
	}

	@RequestMapping(value = "professorAdd", method = RequestMethod.POST)
	@ResponseBody
	public Professor professorAdd(@RequestBody Professor professor) {
		// professor 추가작업
		professorMapper.insert(professor);
		return professor;
	}

}
