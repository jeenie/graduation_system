package net.skhu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.dto.Student;
import net.skhu.dto.StudentGradeFile;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.mapper.CheckStudentGradeMapper;
import net.skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/")
public class CheckStudentGradeController {
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	CheckStudentGradeMapper checkStudentGradeMapper;


	@RequestMapping("vinfo")
	public String viewInfo(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		// 학생 정보
		Student student =checkStudentGradeMapper.findOneMini(userNumber);
		model.addAttribute("student", student);

		// 학생 수강과목, 성적
		List<StudentSubjectGrade> grades=checkStudentGradeMapper.grade(userNumber);
		model.addAttribute("grades", grades);

		// 학생 총 취득 학점, 총 평점
		StudentGradeFile totalG=checkStudentGradeMapper.totalGrade1(userNumber);
		model.addAttribute("totalG", totalG);

		// 학생 전필 총점
		StudentGradeFile totalRM=checkStudentGradeMapper.totalRequiredMajor(userNumber);
		model.addAttribute("totalRM", totalRM);

		// 학생 전선 총점
		StudentGradeFile totalSM=checkStudentGradeMapper.totalSelectedMajor(userNumber);
		model.addAttribute("totalSM", totalSM);

		// 학생 교필 총점
		StudentGradeFile totalRC=checkStudentGradeMapper.totalRequiredCulture(userNumber);
		model.addAttribute("totalRC", totalRC);

		// 학생 교선 총점
		StudentGradeFile totalSC=checkStudentGradeMapper.totalSelectedCulture(userNumber);
		model.addAttribute("totalSC", totalSC);

		return "user/checkStudentGrade";
		}
/***
	@RequestMapping("vgrade ")
	public String viewgrade(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		List<StudentSubjectGrade> grades=checkStudentGradeMapper.grade(userNumber);
		model.addAttribute("grades", grades);

		return "user/checkStudentGrade";
		}***/

}
