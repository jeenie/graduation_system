package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.Professor;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@RequestMapping("/user")
@Controller
public class RegisterController {
	@Autowired
	UserMapper userMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	ProfessorMapper professorMapper;

	@RequestMapping(value="registerProfessor", method = RequestMethod.GET)
	public String sign(Model model) {
		Professor professor = new Professor();
		List<Department> departments = departmentMapper.findAll();

		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "admin/registerProfessor";
	}

	@RequestMapping(value="registerProfessor", method = RequestMethod.POST)
	public String sign(Model model, Professor professor) {
		User user = new User();

		user.setUserId(professor.getId());
		professor.setPassword(Encryption.encrypt(professor.getPassword(), Encryption.MD5));
		user.setPassword(professor.getPassword());
		user.setUserType("교수");
		userMapper.insert(user);
		professorMapper.insert(professor);

		return "redirect:professorInquiry";
	}
}
