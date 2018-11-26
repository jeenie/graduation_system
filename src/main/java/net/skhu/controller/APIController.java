package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.skhu.dto.Subject;
import net.skhu.mapper.SubjectMapper;

@RestController
public class APIController {
	@Autowired SubjectMapper subjectMapper;
	
	@RequestMapping("/api/findSubject")
	public List<Subject> subjectList(@RequestParam("st") String st) {
		List<Subject> subjects = null;
		//if(ss.equals("0"))  
		//	subjects = subjectMapper.findById(st);
		//else if(ss.equals("1")) 
		subjects = subjectMapper.findByName(st);;
		return subjects;
	}
}
