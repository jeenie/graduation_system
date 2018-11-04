package net.skhu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@Controller
@RequestMapping("/guest")
public class FindPasswordController {
	@Autowired StudentMapper studentMapper;
	@Autowired UserMapper userMapper;
	
	@RequestMapping("findPw")
	public String findPw() {
		return "guest/choice";
	}
	
	@RequestMapping(value="findStudentPw", method=RequestMethod.GET)
	public String findStudentPw(Model model) {
		Student student = new Student();
		model.addAttribute("student", student);
		return "guest/studentPw";
	}
	
	@RequestMapping(value="findStudentPw", method=RequestMethod.POST)
	public String findStudentPw(Model model, Student student) {
		boolean success = false;
		if(studentMapper.findOne(student.getId()) != null) {
			Student stu = studentMapper.findOne(student.getId());
			
			if(stu.getEmail().equals(student.getEmail())) {
				success = true;
				return "redirect:pwQuiz?success=true&id=" + stu.getId();
			}
		}
		return "guest/studentPw";
	}
	
	@RequestMapping(value="pwQuiz", method=RequestMethod.GET)
	public String pwQuiz(Model model, @RequestParam("success") boolean success, @RequestParam("id") int id) {
		Student student = studentMapper.findWithQuiz(id);
		model.addAttribute("student", student);
		return "guest/pwQuiz";
	}
	
	@RequestMapping(value="pwQuiz", method=RequestMethod.POST)
	public String pwQuiz(Model model, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String answer = request.getParameter("answer");
		Student stu = studentMapper.findOne(id);
		
		if(stu.getPasswordAnswer().equals(answer))
			return "redirect:changePassword?id=" + id;
		return "guest/pwQuiz";
	}
	
	@RequestMapping(value="changePassword", method=RequestMethod.GET)
	public String changePassword (Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findOne(id);
		student.setPassword("");
		student.setPassword2("");
		model.addAttribute("student", student);
		return "guest/changePw";
	}
	
	@RequestMapping(value="changePassword", method=RequestMethod.POST)
	public String changePassword (Model model, Student student) {
		Student stu = studentMapper.findOne(student.getId());
		User user = userMapper.findOne(student.getId());
		String password = Encryption.encrypt(student.getPassword(), Encryption.MD5);
		stu.setPassword(password);
		stu.setPassword2(password);
		user.setPassword(password);
		userMapper.update(user);
		studentMapper.updatePassword(student);
		return "redirect:login";
	}
	
	@RequestMapping("findProfessorPw")
	public String findProfessorPw() {
		return "guest/professorPw";
	}
}
