package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.skhu.dto.Comment;
import net.skhu.dto.Major;
import net.skhu.dto.Student;
import net.skhu.dto.Subject;
import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.CommentMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MajorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.SubjectMapper;
import net.skhu.mapper.SubstitutionSubjectMapper;
import net.skhu.model.StudentVO;
import net.skhu.service.ModalService;

@RestController
public class APIController {
	@Autowired CommentMapper commentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired MajorMapper majorMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired SubstitutionSubjectMapper substitutionSubjectMapper;
	@Autowired ModalService modal;
	
	@RequestMapping("findSubject")
	public List<Subject> subjectList(@RequestParam("ss") String ss, @RequestParam("st") String st) {
		List<Subject> subjects = null;
		System.out.println(ss);
		System.out.println(st);
		if(ss.equals("0"))  
			subjects = subjectMapper.findById(st);
		else if(ss.equals("1")) 
			subjects = subjectMapper.findByName(st);;
		return subjects;
	}
	
	@RequestMapping("findSubject2")
	public List<Subject> subjectList2(@RequestParam("ss2") String ss2, @RequestParam("st2") String st2) {
		List<Subject> subjects = null;
		System.out.println(ss2);
		System.out.println(st2);
		if(ss2.equals("0"))  
			subjects = subjectMapper.findById(st2);
		else if(ss2.equals("1")) 
			subjects = subjectMapper.findByName(st2);;
		return subjects;
	}
	
	@RequestMapping("findSubject3")
	public List<Subject> subjectList3(@RequestParam("ss3") String ss3, @RequestParam("st3") String st3) {
		List<Subject> subjects = null;
		System.out.println(ss3);
		System.out.println(st3);
		if(ss3.equals("0"))  
			subjects = subjectMapper.findById(st3);
		else if(ss3.equals("1")) 
			subjects = subjectMapper.findByName(st3);;
		return subjects;
	}
	
	@RequestMapping("subjectData")
	public SubstitutionSubject subjectList2(@RequestParam("subjectId") String subjectId) {
		System.out.println(subjectId);
		SubstitutionSubject subject = substitutionSubjectMapper.findBySubjectId(subjectId);
		return subject;
	}
		
	@RequestMapping("deleteSubject")
	public void deleteSubject(@RequestParam("subjectId") String subjectId) {
		SubstitutionSubject subject = substitutionSubjectMapper.findBySubjectId(subjectId);
		System.out.println("삭제할 데이터 코드 : ");
		System.out.println(subject.getAbolitionSubject());
		substitutionSubjectMapper.delete(subject);;
	}

	// 학과별 졸업요건 수정
	@RequestMapping("addMajorSubject")
	public void addMajorSubject(@RequestParam("subjectId") String subjectId, @RequestParam("departmentId") int departmentId, @RequestParam("entranceYear") int entranceYear) {
		Major major = new Major();
		major.setDepartmentId(departmentId);
		major.setMajorSubjectId(subjectId);
		if(entranceYear > 2013)
			major.setEntranceYear(2014);
		else
			major.setEntranceYear(2013);
		major.setCompleteType("필수");
		
		majorMapper.insert(major);
	}
	
	//http://localhost:8080/graduation_system/please?id=203032002
	@RequestMapping("please")
	public Student studentInfo(@RequestParam("id") int id) {
		System.out.println("id파라미터로 받기 성공");
		Student student = studentMapper.findById2(id);
		System.out.println("해당id에 대한 정보 가져오기 성공");
		return student;
	}
	
	@RequestMapping("info")
	public StudentVO info(@RequestParam("id") int id) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int professorId = Integer.parseInt(authentication.getName());
		StudentVO student = modal.fillData(id, professorId);
		return student;
	}
	
	// 코멘트 삭제
	@RequestMapping("deleteComment")
	public void deleteComment(@RequestParam("commentId") int commentId) {
		System.out.println("삭제할 코멘트 아이디 : " + commentId);
		commentMapper.delete(commentId);
	}
	
}