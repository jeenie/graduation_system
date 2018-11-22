package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.OtherMajor;
import net.skhu.dto.OtherMajorType;
import net.skhu.dto.Student;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.OtherMajorMapper;
import net.skhu.mapper.OtherMajorTypeMapper;
import net.skhu.mapper.StudentMapper;

@Controller
@RequestMapping("student/")
public class OtherMajorController {

	@Autowired OtherMajorMapper otherMajorMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired OtherMajorTypeMapper otherMajorTypeMapper;
	@Autowired StudentMapper studentMapper;


	@RequestMapping(value="otherMajor", method=RequestMethod.POST)	//submit 누르면 실행
    public String otherMajorInsert(Model model, OtherMajor otherMajor) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
		otherMajor.setStudentId(userNumber);
        otherMajorMapper.insert(otherMajor);
        otherMajorMapper.update(userNumber,otherMajor.getType());
        return "redirect:/student/status";
    }

	@RequestMapping("otherMajor")		//+버튼 누르면 edit페이지로 이동
	public String selectOtherMajor(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        Student student1=studentMapper.findOne(userNumber);

		OtherMajor otherMajor = new OtherMajor();
		List<StudentSubjectGrade> anotherMajorList = otherMajorMapper.anotherMajorList(userNumber,student1.getDepartmentId());

		List<OtherMajorType> types = otherMajorTypeMapper.otherMajorType();
		model.addAttribute("otherMajor", otherMajor);
		model.addAttribute("anotherMajorList", anotherMajorList);
		model.addAttribute("types", types);
        return "student/otherMajorEdit";
    }

	@RequestMapping(value="fillData", method=RequestMethod.GET)		//+버튼 누르면 edit페이지로 이동
	public String fillOtherMajorData(Model model,@RequestParam("subjectId") String subjectId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        Student stu = studentMapper.findById(userNumber);
        int departmentId = stu.getDepartmentId();
        List<StudentSubjectGrade> anotherMajorList = otherMajorMapper.anotherMajorList(userNumber,stu.getDepartmentId());
		OtherMajor otherMajorData = otherMajorMapper.otherMajorData(userNumber, subjectId);
		model.addAttribute("otherMajor", otherMajorData);
		model.addAttribute("anotherMajorList", anotherMajorList);
		model.addAttribute("subjectId", subjectId);
		
		List<OtherMajorType> types = otherMajorTypeMapper.otherMajorType();
		model.addAttribute("types", types);
        return "student/otherMajorEdit";
    }

}