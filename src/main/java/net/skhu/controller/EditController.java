package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.Master;
import net.skhu.dto.PasswordQuiz;
import net.skhu.dto.Professor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@RequestMapping("/user")
@Controller
public class EditController {
	@Autowired
	UserMapper userMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	MasterMapper masterMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	PasswordQuizMapper passwordQuizMapper;

	@RequestMapping(value="studentEdit", method=RequestMethod.GET)
	public String edit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Student student = studentMapper.findById(userNumber);
		List<Department> departments = departmentMapper.findAll();
		List<PasswordQuiz> quizs = passwordQuizMapper.findAll();
		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		model.addAttribute("quizs", quizs);
		return "edit/studentEdit";
	}

	@RequestMapping(value="studentEdit", method=RequestMethod.POST)
	public String edit(Model model, Student student) {
		User user = userMapper.findOne(student.getId());
		student.setPassword(Encryption.encrypt(student.getPassword(), Encryption.MD5));
		student.setPassword2(Encryption.encrypt(student.getPassword2(), Encryption.MD5));
		user.setPassword(student.getPassword());
		userMapper.update(user);
		studentMapper.update(student);
		return "redirect:index";
	}

	@RequestMapping(value="professorEdit", method=RequestMethod.GET)
	public String professorEdit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Professor professor = professorMapper.findById(userNumber);
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "edit/professorEdit";
	}

	@RequestMapping(value="professorEdit", method=RequestMethod.POST)
	public String professorEdit(Model model, Professor professor) {
		User user = userMapper.findOne(professor.getId());
		professor.setPassword(Encryption.encrypt(professor.getPassword(), Encryption.MD5));
		user.setPassword(professor.getPassword());
		userMapper.update(user);
		professorMapper.update(professor);
		return "redirect:index";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.GET)
	public String adminEdit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Master master = masterMapper.findById(userNumber);
		model.addAttribute("master", master);
		return "edit/adminEdit";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.POST)
	public String adminEdit(Model model, Master master) {
		User user = userMapper.findOne(master.getId());
		master.setPassword(Encryption.encrypt(master.getPassword(), Encryption.MD5));
		user.setPassword(master.getPassword());
		userMapper.update(user);
		masterMapper.update(master);
		return "redirect:index";
	}
}
