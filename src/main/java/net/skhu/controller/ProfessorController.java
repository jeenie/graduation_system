package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Department;
import net.skhu.dto.Professor;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@Controller
@RequestMapping("/user")
public class ProfessorController {

	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired UserMapper userMapper;

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
		List<Department> departments = departmentMapper.findRealDept();
		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "user/professorAdd";
	}

	@RequestMapping(value = "professorAdd", method = RequestMethod.POST)
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

	@RequestMapping("professorDelete")
	public String professorDelete(@RequestParam("id") int id) {
		professorMapper.delete(id);
		return "redirect:professorInquiry";
	}

}
