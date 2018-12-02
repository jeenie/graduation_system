package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.skhu.dto.Subject;
import net.skhu.dto.Student;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.SubjectMapper;

@RestController
public class APIController {
	@Autowired SubjectMapper subjectMapper;
	@Autowired StudentMapper studentMapper;
	
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

	//http://localhost:8080/graduation_system/please?id=203032002
	@RequestMapping("please")
	public Student studentInfo(@RequestParam("id") int id) {
		System.out.println("id파라미터로 받기 성공");
		Student student = studentMapper.findById2(id);
		System.out.println("해당id에 대한 정보 가져오기 성공");
		return student;
	}
	
}