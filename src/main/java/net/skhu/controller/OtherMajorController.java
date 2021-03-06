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
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.OtherMajorMapper;
import net.skhu.mapper.OtherMajorTypeMapper;
import net.skhu.mapper.StudentMapper;

@Controller
@RequestMapping("student/")
public class OtherMajorController {

	@Autowired
	OtherMajorMapper otherMajorMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	OtherMajorTypeMapper otherMajorTypeMapper;
	@Autowired
	StudentMapper studentMapper;

	@RequestMapping(value = "otherMajor", method = RequestMethod.POST) // submit 누르면 실행
	public String otherMajorInsert(Model model, OtherMajor otherMajor) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int userNumber = Integer.parseInt(authentication.getName());

		OtherMajor omt = otherMajorMapper.otherMajorData(userNumber, otherMajor.getAnotherMajorId());

		otherMajor.setDepartmentId(omt.getDepartmentId());
		otherMajor.setBeforeType(omt.getBeforeType());
		otherMajor.setScore(omt.getScore());
		otherMajor.setSemester(omt.getSemester());
		otherMajor.setYear(omt.getYear());
		otherMajor.setStudentId(userNumber);

		otherMajorMapper.insert(otherMajor);
		otherMajorMapper.update(userNumber, otherMajor.getType(), otherMajor.getAnotherMajorId());
		return "redirect:/student/status";
	}

	@RequestMapping("otherMajor") // +버튼 누르면 edit페이지로 이동
	public String selectOtherMajor(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int userNumber = Integer.parseInt(authentication.getName());
		Student student1 = studentMapper.findOne(userNumber);

		OtherMajor otherMajor = new OtherMajor();
		List<OtherMajor> anotherMajorList = otherMajorMapper.anotherMajorList(userNumber, student1.getDepartmentId());

		List<OtherMajorType> types = otherMajorTypeMapper.otherMajorType();
		model.addAttribute("otherMajor", otherMajor);
		model.addAttribute("anotherMajorList", anotherMajorList);
		model.addAttribute("types", types);
		return "student/otherMajorEdit";
	}

	// 타전공 등록 폼2
	@RequestMapping("otherMajor2")		//+버튼 누르면 edit페이지로 이동
	public String selectOtherMajor2(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        Student student1=studentMapper.findOne(userNumber);

		OtherMajor otherMajor = new OtherMajor();
		List<OtherMajor> anotherMajorList = otherMajorMapper.anotherMajorList(userNumber,student1.getDepartmentId());

		List<OtherMajorType> types = otherMajorTypeMapper.otherMajorType();
		model.addAttribute("otherMajor", otherMajor);
		model.addAttribute("anotherMajorList", anotherMajorList);
		model.addAttribute("types", types);
        return "student/otherMajorEdit2";
    }

	@RequestMapping(value="fillData", method=RequestMethod.GET)		//+버튼 누르면 edit페이지로 이동
	public String fillOtherMajorData(Model model, @RequestParam("subjectId") String subjectId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        Student stu = studentMapper.findById(userNumber);
        int departmentId = stu.getDepartmentId();
        List<OtherMajor> anotherMajorList = otherMajorMapper.anotherMajorList(userNumber,stu.getDepartmentId());
		OtherMajor otherMajorData = otherMajorMapper.otherMajorData(userNumber, subjectId);
		List<OtherMajorType> types = otherMajorTypeMapper.otherMajorType();
		model.addAttribute("otherMajor", otherMajorData);
		model.addAttribute("anotherMajorList", anotherMajorList);
		model.addAttribute("subjectId", subjectId);
		model.addAttribute("types", types);
        return "student/otherMajorEdit2";
	}

	@RequestMapping(value="fillData", method=RequestMethod.POST)
	public String otherMajorInsert2(Model model, OtherMajor otherMajor) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
		OtherMajor omt = otherMajorMapper.otherMajorData(userNumber, otherMajor.getAnotherMajorId());
		otherMajor.setStudentId(userNumber);
		otherMajor.setDepartmentId(omt.getDepartmentId());
		otherMajor.setBeforeType(omt.getBeforeType());
		System.out.println(otherMajor.getStudentId());
		System.out.println(otherMajor.getAnotherMajorId());
		System.out.println(otherMajor.getDepartmentId());
		String type = otherMajor.getType();
		String subjectId = otherMajor.getAnotherMajorId();
        otherMajorMapper.insert(otherMajor);
		otherMajorMapper.update(userNumber, type, subjectId);
		return "redirect:/student/status";
    }

	@RequestMapping(value="majordelete", method=RequestMethod.GET)
    public String substiDelete(@RequestParam("subjectId") String subjectId) {
    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        String type = otherMajorMapper.findBeforeType(userNumber, subjectId);
        otherMajorMapper.update(userNumber, type, subjectId);
        otherMajorMapper.delete(userNumber, subjectId);
    	return "redirect:/student/status";
    }
}