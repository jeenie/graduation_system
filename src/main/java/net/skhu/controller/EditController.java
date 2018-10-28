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
import net.skhu.dto.PasswordQuiz;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.PasswordQuizMapper;
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
}
