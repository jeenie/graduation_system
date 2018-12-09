package net.skhu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.ParseException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import net.skhu.dto.StudentAdmin;
import net.skhu.dto.StudentAdmin2;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentAdminMapper;
import net.skhu.service.StudentService;

@Controller
@RequestMapping("/user")
public class ProfessorController {

	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	StudentService studentService;
	@Autowired
	StudentAdminMapper studentAdminMapper;

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
	
	@RequestMapping(value="studentListForProfessor", method=RequestMethod.GET)
	public String list2(Model model) {
		List<Student> students = studentService.list();
		List<Department> departments = departmentMapper.findRealDept();
		StudentAdmin2 studentAdmin = new StudentAdmin2();
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		model.addAttribute("studentAdmin", studentAdmin);
		return "user/studentListForProfessor";
	}
	
	@RequestMapping(value="studentListForAdmin", method=RequestMethod.POST)
	public String inputComment(StudentAdmin2 studentAdmin) throws ParseException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int userNumber = Integer.parseInt(authentication.getName());
		System.out.println("문제-1");
		// StudentAdmin stu = studentAdmin;
		////stu.setProfessorId(userNumber);
		
		Date myDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(myDate);
		Date dt = sdf.parse(strToday);
		
		//stu.setDate(dt);
		
		//studentAdminMapper.insert(stu);
		
		System.out.println("성공");
		return "redirect:studentListForProfessor";
	}

}
