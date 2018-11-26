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

import net.skhu.dto.CoreSubject;
import net.skhu.dto.Culture;
import net.skhu.dto.Department;
import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Exploration;
import net.skhu.dto.Major;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.RequiredCultureSubject;
import net.skhu.dto.SpecialProcess;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.dto.Subject;
import net.skhu.dto.Total;
import net.skhu.mapper.ChapelSubjectMapper;
import net.skhu.mapper.CoreSubjectMapper;
import net.skhu.mapper.CultureMapper;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.ExplorationMapper;
import net.skhu.mapper.MajorMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.RequiredCultureCountMapper;
import net.skhu.mapper.RequiredCultureSubjectMapper;
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
	@Autowired
	ChapelSubjectMapper chapelSubjectMapper;
	@Autowired
	RequiredCultureSubjectMapper requiredCultureSubjectMapper;
	@Autowired
	ExplorationMapper explorationMapper;
	@Autowired
	CoreSubjectMapper coreSubjectMapper;

	@RequestMapping("user/studentListForAdmin")
	public String list(Model model) {
		List<Student> students = studentMapper.findAll();
		List<Department> departments = departmentMapper.findRealDept();
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		return "user/studentListForAdmin";
	}

	@RequestMapping("user/studentListForProfessor")
	public String list2(Model model) {
		List<Student> students = studentMapper.findAll();
		List<Department> departments = departmentMapper.findRealDept();
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		return "user/studentListForProfessor";
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
		if (entranceYear == 2013)
			mustmajor2 = majorMapper.findMustMajorBy2013User(departmentId, entranceYear);

		List<Major> major2018 = null;
		List<CoreSubject> allcores = null;
		Exploration exploration = explorationMapper.find();
		int explorationGrade = exploration.getExploration();
		int coreTotal = 0;
		int c101Total = 0;
		int c102Total = 0;
		int c103Total = 0;
		int c201Total = 0;
		int c202Total = 0;
		int c203Total = 0;
		int c301Total = 0;
		int c302Total = 0;
		int c1Total = 0;
		int c2Total = 0;
		int c3Total = 0;
		if (entranceYear == 2018) {
			major2018 = majorMapper.findMajorList2018(userNumber);
			allcores = coreSubjectMapper.findAllCoreSubject(userNumber);
			for (CoreSubject cs : allcores) {
				coreTotal += cs.getSubjectScore();
				if (cs.getCoreCode().equals("c101"))
					c101Total += cs.getSubjectScore();
				else if (cs.getCoreCode().equals("c102"))
					c102Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c103"))
					c103Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c201"))
					c201Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c202"))
					c202Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c203"))
					c203Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c301"))
					c301Total += cs.getSubjectScore();

				else if (cs.getCoreCode().equals("c302"))
					c302Total += cs.getSubjectScore();
			}
			c1Total = c101Total + c102Total + c103Total;
			c2Total = c201Total + c202Total + c203Total;
			c3Total = c301Total + c302Total;
		}
		System.out.println(coreTotal);
		System.out.println(c201Total);
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		int serveSubject = serveSubjectMapper.findById(userNumber);
		int chapelSubject = chapelSubjectMapper.findById(userNumber);
		List<RequiredCultureSubject> requiredCultureSubject = requiredCultureSubjectMapper.findByYear2(entranceYear);
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
		model.addAttribute("chapelSubject", chapelSubject);
		model.addAttribute("processId", processId);
		model.addAttribute("requiredCultureSubject", requiredCultureSubject);
		model.addAttribute("entranceYear", entranceYear);
		model.addAttribute("mustMajor", mustMajor);
		model.addAttribute("major2018", major2018);
		model.addAttribute("explorationGrade", explorationGrade);
		model.addAttribute("coreTotal", coreTotal);
		model.addAttribute("c101Total", c101Total);
		model.addAttribute("c102Total", c102Total);
		model.addAttribute("c103Total", c103Total);
		model.addAttribute("c201Total", c201Total);
		model.addAttribute("c202Total", c202Total);
		model.addAttribute("c203Total", c203Total);
		model.addAttribute("c301Total", c301Total);
		model.addAttribute("c302Total", c302Total);
		model.addAttribute("c1Total", c1Total);
		model.addAttribute("c2Total", c2Total);
		model.addAttribute("c3Total", c3Total);
		return "student/graduationStatus";
	}
}