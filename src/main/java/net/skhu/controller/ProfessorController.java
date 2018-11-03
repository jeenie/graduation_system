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
import net.skhu.dto.Student;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;

@Controller
@RequestMapping("/user")
public class ProfessorController {

	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	DepartmentMapper departmentMapper;

	@RequestMapping(value="professorInquiry", method=RequestMethod.GET) 
	public String professorInquiry(Model model) {
		List<Professor> professors = professorMapper.findAll(); 
		model.addAttribute("professors", professors);
		return "user/professorInquiry";
	}
	
	@RequestMapping(value="professorSearch", method=RequestMethod.GET)
	public String professorSearch(Model model,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "departmentName", required = false) String departmentName) {

		List<Professor> professors = professorMapper.findByInquiry(name, id, departmentName);
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("departmentName", departmentName);
		model.addAttribute("professors", professors);

		return "user/professorInquiry";
	}

	@RequestMapping(value = "professorAdd", method = RequestMethod.GET)
	public String professorAdd(Model model) {
		Professor professor = new Professor();
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "user/professorAdd";
	}

	@RequestMapping(value = "professorAdd", method = RequestMethod.POST)
	public String professorAdd(Model model, Professor professor) {
		int r1 = (int) (Math.random() * 1000);
		String r2 = Integer.toString(r1);
		professor.setEmail("default" + r2 + "@naver.com");// professor 테이블에서 not null처리가 되어있어서 임의로 값 대입
		professor.setPassword(r2); // professor 테이블에서 not null처리가 되어있어서 임의로 값 대입
		professorMapper.insert(professor);
		return "redirect:professorInquiry";
	}

	@RequestMapping("professorDelete")
	public String professorDelete(@RequestParam("id") int id) {
		professorMapper.delete(id);
		return "redirect:professorInquiry";
	}

}
