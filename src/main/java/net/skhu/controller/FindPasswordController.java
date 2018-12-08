package net.skhu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Professor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.service.GuestService;
import net.skhu.utils.Encryption;

@Controller
@RequestMapping("/guest")
public class FindPasswordController {
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired UserMapper userMapper;
	@Autowired GuestService guestService;
	
	static String certificationNumber = null;
	
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
				model.addAttribute("success", success);
				return "redirect:pwQuiz?id=" + stu.getId();
			}
		}
		boolean error = true;
		model.addAttribute("error", error);
		return "guest/studentPw";
	}
	
	@RequestMapping(value="pwQuiz", method=RequestMethod.GET)
	public String pwQuiz(Model model, @RequestParam("id") int id) {
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
		
		boolean error = true;
		model.addAttribute("error", error);
		Student student = studentMapper.findWithQuiz(id);
		model.addAttribute("student", student);
		return "guest/pwQuiz";
	}
	
	@RequestMapping(value="changePassword", method=RequestMethod.GET)
	public String changePassword (Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findOne(id);
		student.setPassword("");
		student.setPassword2("");
		model.addAttribute("student", student);
		model.addAttribute("er", true);
		return "guest/changePw";
	}
	
	@RequestMapping(value="changePassword", method=RequestMethod.POST)
	public String changePassword (Model model, Student student) {
		if(student.getPassword().equals(student.getPassword2())) {
			Student stu = studentMapper.findOne(student.getId());
			User user = userMapper.findOne(student.getId());
			String password = Encryption.encrypt(student.getPassword(), Encryption.MD5);
			stu.setPassword(password);
			stu.setPassword2(password);
			user.setPassword(password);
			userMapper.update(user);
			studentMapper.updatePassword(student);
			boolean success = true;
			model.addAttribute("er", false);
			model.addAttribute("success", success);
			return "guest/changePw";
		} else {
			boolean error = true;
			model.addAttribute("er", false);
			model.addAttribute("error", error);
			return "guest/changePw";
		}
	}
	
	
	//교수 비밀번호 찾기 
	@RequestMapping(value="findProfessorPw", method=RequestMethod.GET)
	public String findProfessorPw(Model model) {
		Professor professor = new Professor();
		model.addAttribute("professor", professor);
		return "guest/professorPw";
	}
	
	@RequestMapping(value="findProfessorPw", method=RequestMethod.POST)
	public String findProfessorPw(Model model, Professor professor) throws IOException{
		boolean success = false;
		if(professorMapper.findById(professor.getId()) != null) {
			Professor pro = professorMapper.findById(professor.getId());
			
			if(pro.getEmail().equals(professor.getEmail())) {
				success = true;
				guestService.sendEmail(professor.getEmail());
				System.out.println(guestService.save);
				certificationNumber = guestService.save;
				return "redirect:certification";
			}
			
			
		}
		model.addAttribute("error", true);
		return "guest/professorPw";
	}
	
	@RequestMapping("certification")
	public String certification() {
		return "guest/certification";
	}
	
	@RequestMapping(value="certificationNumber", method=RequestMethod.GET)
	public String certification(Model model, @RequestParam("cn") String cn) {
		
		System.out.println(certificationNumber);
		System.out.println(cn);
		if(cn.equals(certificationNumber)) {
			return "guest/changePw";
		} else {
			model.addAttribute("error", true);
			return "guest/certification";
		}
	}
}
