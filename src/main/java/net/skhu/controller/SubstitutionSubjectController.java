package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.SubjectMapper;
import net.skhu.mapper.SubstitutionSubjectMapper;

@Controller
@RequestMapping("/graduation")
public class SubstitutionSubjectController {
	@Autowired DepartmentMapper departmentMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired SubstitutionSubjectMapper substitutionSubjectMapper;
	
	@RequestMapping("SubstitutionSubject")
	public String list(Model model) {
		SubstitutionSubject substitutionSubject = new SubstitutionSubject();
		List<SubstitutionSubject> substitutionSubjectList = substitutionSubjectMapper.findAll();
		model.addAttribute("substitutionSubjectList", substitutionSubjectList);
		model.addAttribute("substitutionSubject", substitutionSubject);
		model.addAttribute("departments", departmentMapper.findAll());
		return "admin/substituteSubject";
	}
	
	//대체과목 추가
	@RequestMapping(value="addSubject", method=RequestMethod.POST)
	public String addSubject(Model model, @RequestParam(value="departmentId") int departmentId, @RequestParam(value="abolitionSubject") String abolitionSubject, @RequestParam(value="substitutionSubject") String substitutionSubject) {
		SubstitutionSubject subSubject = new SubstitutionSubject();
		subSubject.setDepartmentId(departmentId);
		subSubject.setAbolitionSubject(abolitionSubject);
		subSubject.setSubstitutionSubject(substitutionSubject);
		substitutionSubjectMapper.insert(subSubject);
		return "redirect:SubstitutionSubject";
	}
	
	//대체과목 수정
		@RequestMapping(value="editSubject", method=RequestMethod.POST)
		public String editSubject(Model model, @RequestParam(value="abolitionSubject") String abolitionSubject, @RequestParam(value="substitutionSubject") String substitutionSubject) {
			System.out.println(abolitionSubject);
			System.out.println(substitutionSubject);
			SubstitutionSubject subSubject = substitutionSubjectMapper.findBySubjectId(abolitionSubject);
			subSubject.setSubstitutionSubject(substitutionSubject);
			substitutionSubjectMapper.update(subSubject);
			return "redirect:SubstitutionSubject";
		}
	
	@RequestMapping(value="findSubject", method=RequestMethod.GET)
	public String searchSubject(Model model, @RequestParam(value="subject") String subject, SubstitutionSubject substitutionSubject) {
		List<SubstitutionSubject> subjects = substitutionSubjectMapper.findBySubject(subject);
		model.addAttribute("subject", subject);
		model.addAttribute("substitutionSubjectList", subjects);
		model.addAttribute("departments", departmentMapper.findAll());
		return "admin/substituteSubject";
	}
	
	@RequestMapping(value="selectSubject", method=RequestMethod.GET)
	public String selectSubject(Model model, @RequestParam(value="subjectId") String subjectId) {
		SubstitutionSubject subject = substitutionSubjectMapper.findBySubjectId(subjectId);
		model.addAttribute("departments", departmentMapper.findAll());
		model.addAttribute("subjectDept", subject.getDepartmentId());
		return "admin/substituteSubject";
	}
}
