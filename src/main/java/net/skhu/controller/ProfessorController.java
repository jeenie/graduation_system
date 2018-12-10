package net.skhu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.ParseException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Department;
import net.skhu.dto.Professor;

import net.skhu.dto.Student;
import net.skhu.dto.StudentAdmin;
import net.skhu.dto.StudentAdmin2;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentAdminMapper;
import net.skhu.service.StudentService;

import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@Controller
public class ProfessorController {

	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	StudentService studentService;
	@Autowired
	StudentAdminMapper studentAdminMapper;

	@Autowired UserMapper userMapper;


	@RequestMapping(value="user/professorInquiry", method=RequestMethod.GET) 
	public String professorInquiry(Model model) {
		List<Professor> professors = professorMapper.findAll(); 
		model.addAttribute("professors", professors);
		return "user/professorInquiry";
	}
	
	@RequestMapping(value="user/professorSearch", method=RequestMethod.GET)
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

	@RequestMapping(value = "user/professorAdd", method = RequestMethod.GET)
	public String professorAdd(Model model) {
		Professor professor = new Professor();
		List<Department> departments = departmentMapper.findRealDept();
		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "user/professorAdd";
	}

	@RequestMapping(value = "user/professorAdd", method = RequestMethod.POST)
	public String professorAdd(Model model, Professor professor) {
		int r1 = (int) (Math.random() * 1000);
		String r2 = Integer.toString(r1);
		professor.setEmail("설정 필요");// professor 테이블에서 not null처리가 되어있어서 임의로 값 대입
		professor.setPassword("test123");
		professor.setPassword(Encryption.encrypt(professor.getPassword(), Encryption.MD5));
		User user = new User();
		user.setUserId(professor.getId());
		System.out.println("교수테이블 비밀번호" + professor.getPassword());
		user.setPassword(professor.getPassword());
		System.out.println("사용자 테이블 비밀번호" + user.getPassword());
		user.setUserType("교수");
		professorMapper.insert(professor);
		userMapper.insert(user);
		return "redirect:professorInquiry";
	}

	@RequestMapping("user/professorDelete")
	public String professorDelete(@RequestParam("id") int id) {
		professorMapper.delete(id);
		return "redirect:professorInquiry";
	}
	
	@RequestMapping(value="professor/studentListForProfessor", method=RequestMethod.GET)
	public String list2(Model model) {
		List<Student> students = studentService.list();
		List<Department> departments = departmentMapper.findRealDept();
		
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
	
		model.addAttribute("temp", studentAdminMapper.findById());
		return "user/studentListForProfessor";
	}
	
	@RequestMapping(value = "professor/studentSearch", method = RequestMethod.GET) 
	public String studentSearch(Model model,
			@RequestParam(value = "departmentName", required = false) String departmentName,
			@RequestParam(value = "grade", required = false) Integer grade,
			@RequestParam(value = "allId", required = false) Integer allId,
			@RequestParam(value = "subjectName", required = false) String subjectName,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "checkbox", required = false) String checkbox) {
		
		List<Student> students = studentService.searchList(departmentName, grade, allId, subjectName, name, id, checkbox);
		model.addAttribute("departments", departmentMapper.findRealDept());
		model.addAttribute("students", students);
		return "user/studentListForProfessor";

	}
	
	@RequestMapping(value="user/inputComment", method=RequestMethod.GET)
	public String inputComment(Model model, @RequestParam("comment")String comment, @RequestParam("studentId") int studentId) throws ParseException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int userNumber = Integer.parseInt(authentication.getName());
		System.out.println("check");
		
		StudentAdmin stu = new StudentAdmin();
		stu.setProfessorId(userNumber);
		System.out.println("check-2");
		
		Date myDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(myDate);
		Date dt = sdf.parse(strToday);
		
		stu.setDateWritten(strToday);
		System.out.println(strToday);
		
		stu.setComment(comment);
		stu.setStudentId(studentId);
		
		studentAdminMapper.insert(stu);
		model.addAttribute("comment", comment);
		model.addAttribute("strToday", strToday);
		
		System.out.println("성공");
		return "redirect:studentListForProfessor";
	}

}
