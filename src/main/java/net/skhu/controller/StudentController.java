package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.dto.Student;
import net.skhu.mapper.StudentMapper;

@Controller
@RequestMapping("/graduation")
public class StudentController {
	@Autowired StudentMapper studentMapper;


	@RequestMapping("studentListForAdmin")
	public String list(Model model) {
		List<Student> students = studentMapper.findAll();
		model.addAttribute("students", students);
		return "graduation/studentListForAdmin";
	}
}
