package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.Master;
import net.skhu.dto.PasswordQuiz;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@RequestMapping("/guest")
@Controller
public class SignCotroller {
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

	@RequestMapping(value="sign", method = RequestMethod.GET)
	public String sign(Model model) {
		Student student = new Student();
		List<Department> departments = departmentMapper.findAll();
		List<PasswordQuiz> quizs = passwordQuizMapper.findAll();

		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		model.addAttribute("quizs", quizs);
		return "guest/sign";
	}

	@RequestMapping(value="sign", method = RequestMethod.POST)
	public String sign(Model model, Student student) {
		User user = new User();

		user.setUserId(student.getId());
		student.setPassword(Encryption.encrypt(student.getPassword(), Encryption.MD5));
		user.setPassword(student.getPassword());
		user.setUserType("학생");
		userMapper.insert(user);
		studentMapper.insert(student);

		return "redirect:login";
	}

	@RequestMapping(value="adminsign", method = RequestMethod.GET)
	public String adminsign(Model model) {
		Master master = new Master();
		model.addAttribute("master", master);
		return "guest/mastersign";
	}

	@RequestMapping(value="adminsign", method = RequestMethod.POST)
	public String adminsign(Model model, Master master) {
		User user = new User();

		user.setUserId(master.getId());
		master.setPassword(Encryption.encrypt(master.getPassword(), Encryption.MD5));
		user.setPassword(master.getPassword());
		user.setUserType("관리자");
		userMapper.insert(user);
		masterMapper.insert(master);

		return "redirect:login";
	}

}
