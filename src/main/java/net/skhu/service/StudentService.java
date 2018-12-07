package net.skhu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import net.skhu.dto.Student;
import net.skhu.mapper.StudentMapper;
import net.skhu.utils.Encryption;

@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;

	
	int majorUnit, cultureUnit;
	public List<Student> list() {
		List<Student> students = studentMapper.findAll();
		for(Student student : students) {
			majorUnit = student.getMajorUnit();
			cultureUnit = student.getCultureUnit();
			if((majorUnit < 60) && (cultureUnit < 70)) {
				student.setmColor("btn-m2");
				student.setcColor("btn-m2");
			}
			else if((majorUnit < 60) && (cultureUnit > 70)) {
				student.setmColor("btn-m2");
				student.setcColor("btn-m1");
				
			}
			else if((majorUnit > 60) && (cultureUnit < 70)) {
				student.setmColor("btn-m1");
				student.setcColor("btn-m2");
			}
			else {
				student.setmColor("btn-m1");
				student.setcColor("btn-m1");
			}
			
		}
		return students;
	}
	
	public List<Student> searchList(String departmentName, Integer grade, Integer allId, String subjectName, String name, Integer id, String checkbox) {
		List<Student> students = studentMapper.findByStudentInquiry(departmentName, grade, allId, subjectName, name, id, checkbox);
		for(Student student : students) {
			majorUnit = student.getMajorUnit();
			cultureUnit = student.getCultureUnit();
			if((majorUnit < 60) && (cultureUnit < 70)) {
				student.setmColor("btn-m2");
				student.setcColor("btn-m2");
			}
			else if((majorUnit < 60) && (cultureUnit > 70)) {
				student.setmColor("btn-m2");
				student.setcColor("btn-m1");
				
			}
			else if((majorUnit > 60) && (cultureUnit < 70)) {
				student.setmColor("btn-m1");
				student.setcColor("btn-m2");
			}
			else {
				student.setmColor("btn-m1");
				student.setcColor("btn-m1");
			}
			
		}
		return students;
	}
	
	
}
