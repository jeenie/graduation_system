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

import net.skhu.dto.Culture;
import net.skhu.dto.Department;
import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Major;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.ServeSubject;
import net.skhu.dto.SpecialProcess;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.dto.Subject;
import net.skhu.dto.Total;
import net.skhu.mapper.CultureMapper;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MajorMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.RequiredCultureCountMapper;
import net.skhu.mapper.ServeSubjectMapper;
import net.skhu.mapper.SpecialProcessMapper;
import net.skhu.mapper.StudentGradefileMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.StudentSubjectGradeMapper;
import net.skhu.mapper.SubjectMapper;
import net.skhu.mapper.TotalMapper;

@Controller
public class StudentController {
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	PasswordQuizMapper passwordQuizMapper;
	@Autowired
	CultureMapper cultureMapper;
	@Autowired
	SpecialProcessMapper specialProcessMapper;
	@Autowired
	StudentGradefileMapper studentGradefileMapper;
	@Autowired
	TotalMapper totalMapper;
	@Autowired
	DepartmentMajorRuleMapper departmentMajorRuleMapper;
	@Autowired
	StudentSubjectGradeMapper studentSubjectGradeMapper;
	@Autowired
	SubjectMapper SubjectMapper;
	@Autowired
	MajorMapper majorMapper;
	@Autowired
	RequiredCultureCountMapper requiredCultureCountMapper;
	@Autowired
	ServeSubjectMapper serveSubjectMapper;

	@RequestMapping("user/studentListForAdmin")
	public String list(Model model) {
		List<Student> students = studentMapper.findAll();
		List<Department> departments = departmentMapper.findRealDept();
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		return "user/studentListForAdmin";
	}

	@RequestMapping(value = "user/studentSearch", method = RequestMethod.GET)
	public String studentSearch(Model model,
			@RequestParam(value = "departmentName", required = false) String departmentName,
			@RequestParam(value = "grade", required = false) Integer grade,
			@RequestParam(value = "subjectName", required = false) String subjectName,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "id", required = false) Integer id) {

		List<Student> students = studentMapper.findByStudentInquiry(departmentName, grade, subjectName, name, id);
		/*
		 * List<Student> studentsFilter = new ArrayList<Student>(); for(int i=0;
		 * i<students.size(); i++) { Student st = students.get(i); for(int j=0;
		 * j<studentsFilter.size(); j++) { if(st.getId() !=
		 * studentsFilter.get(j).getId()) { studentsFilter.add(st); } } }
		 */
		model.addAttribute("departments", departmentMapper.findRealDept());
		model.addAttribute("students", students);
		return "user/studentListForAdmin";

	}

	@RequestMapping("user/studentDelete")
	public String professorDelete(@RequestParam("id") int id) {
		studentMapper.delete(id);
		return "redirect:studentListForAdmin";
	}

	@RequestMapping(value = "student/graduationStatus", method = RequestMethod.GET)
	public String graduationStatus(Model model, @RequestParam("processId") int processId) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int userNumber = Integer.parseInt(authentication.getName());
		Student student = studentMapper.findById2(userNumber);
		Culture culture = cultureMapper.find();
		List<SpecialProcess> specialProcess = specialProcessMapper.findAll();
		StudentGradefile studentGradefile = studentGradefileMapper.findById(userNumber);
		Total total = totalMapper.find();
		int totalGrade = total.getGrade();
		int departmentId = student.getDepartmentId();
		String entranceYearChange = String.valueOf(userNumber).substring(0, 4);
		int entranceYear = Integer.parseInt(entranceYearChange);
		DepartmentMajorRule departmentMajorRule = departmentMajorRuleMapper.findTotalMajor(departmentId, entranceYear,
				processId);
		int cultureGrade = culture.getGrade();
		List<StudentSubjectGrade> mustMajor = studentSubjectGradeMapper.findByIdMustMajor(userNumber);
		List<StudentSubjectGrade> mustCulture = studentSubjectGradeMapper.findByIdMustCulture(userNumber);
		List<Subject> subjects = SubjectMapper.find();
		List<Major> mustmajor2 = majorMapper.findMustMajorByUser(departmentId, entranceYear);
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		ServeSubject serveSubject = serveSubjectMapper.findById(userNumber);
		model.addAttribute("student", student);
		model.addAttribute("specialProcess", specialProcess);
		model.addAttribute("studentGradefile", studentGradefile);
		model.addAttribute("total", totalGrade);
		model.addAttribute("departmentMajorRule", departmentMajorRule);
		model.addAttribute("culture", cultureGrade);
		model.addAttribute("mustMajor", mustMajor);
		model.addAttribute("mustCulture", mustCulture);
		model.addAttribute("subjects", subjects);
		model.addAttribute("mustmajor2", mustmajor2);
		model.addAttribute("requiredCultureCount", requiredCultureCount);
		model.addAttribute("serveSubject", serveSubject);
		model.addAttribute("processId", processId);
		return "student/graduationStatus";
	}
}