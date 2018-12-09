package net.skhu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Major;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.RequiredCultureSubject;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.mapper.ChapelSubjectMapper;
import net.skhu.mapper.DepartmentMajorRuleMapper;
import net.skhu.mapper.MajorMapper;
import net.skhu.mapper.RequiredCultureCountMapper;
import net.skhu.mapper.RequiredCultureSubjectMapper;
import net.skhu.mapper.ServeSubjectMapper;
import net.skhu.mapper.StudentGradefileMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.StudentSubjectGradeMapper;
import net.skhu.mapper.TotalMapper;
import net.skhu.model.StudentVO;

@Service
public class ModalService {
	@Autowired DepartmentMajorRuleMapper departmentMajorMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired StudentGradefileMapper fileMapper;
	@Autowired TotalMapper totalMapper;
	
	@Autowired
	StudentSubjectGradeMapper studentSubjectGradeMapper;
	@Autowired
	MajorMapper majorMapper;
	@Autowired
	RequiredCultureCountMapper requiredCultureCountMapper;
	@Autowired
	ChapelSubjectMapper chapelSubjectMapper;
	@Autowired
	ServeSubjectMapper serveSubjectMapper;
	@Autowired
	RequiredCultureSubjectMapper requiredCultureSubjectMapper;
	
	
	public StudentVO fillData(int id) {
		
		StudentVO stu = new StudentVO();
		stu.setStudent(studentMapper.findById2(id));
		String year = String.valueOf(id).substring(0, 4);
		String department = String.valueOf(id).substring(4,6);
		int entranceYear = Integer.parseInt(year);
		int departmentId = Integer.parseInt(department);
		StudentGradefile file = fileMapper.findById(id);
		
		List<DepartmentMajorRule> rules = departmentMajorMapper.findByDepartmentId(stu.getStudent().getDepartmentId(), entranceYear);
		
		stu.setRules(rules);
		stu.setFileData(file);
		stu.setTotal(totalMapper.find());
		
		
		stu.setEntranceYear(entranceYear);
		
		List<Major> majors = majorMapper.findMustMajorByUser(departmentId, entranceYear);
		List<StudentSubjectGrade> ssgs = studentSubjectGradeMapper.findByIdMustMajor(id);
		
		List<Major> unlisten = new ArrayList<Major>();
		List<StudentSubjectGrade> listen = new ArrayList<StudentSubjectGrade>();
		
		for (Major major : majors ) {
			String str1 = major.getMajorSubjectId();
			int count = 0;
			for(StudentSubjectGrade ssg : ssgs ) {
				String str2 = ssg.getSubjectId();
				if(str1.equals(str2))  { listen.add(ssg); break; }
				++ count;
				
			}
			if(ssgs.size() == count) {
				unlisten.add(major);
			}
		}
		
		stu.setListen(listen);
		stu.setUnlisten(unlisten);
		
		//교양
		RequiredCultureCount requiredCultureCount = requiredCultureCountMapper.find();
		int serveSubject = serveSubjectMapper.findById(id);
		int chapelSubject = chapelSubjectMapper.findById(id);
		
		stu.setRequiredCultureCount(requiredCultureCount);
		stu.setServeSubject(serveSubject);
		stu.setChapelSubject(chapelSubject);
		
		
		List<StudentSubjectGrade> mustCulture = studentSubjectGradeMapper.findByIdMustCulture(id);
		stu.setMustCulture(mustCulture);
		
		
		List<RequiredCultureSubject> requiredCultureSubject = requiredCultureSubjectMapper.findByYear2(entranceYear);
	
		List<StudentSubjectGrade> s1 = new ArrayList<StudentSubjectGrade>();
		List<RequiredCultureSubject> s2 = new ArrayList<RequiredCultureSubject>();
		
		for(RequiredCultureSubject re : requiredCultureSubject) {
			String str1 = re.getSubjectId();
			int count = 0;
			for(StudentSubjectGrade ssg : mustCulture) {
				
				String str2 = ssg.getSubjectId();
				if(str1.equals(str2)) { s1.add(ssg); break; }
				++count;
			}
			if(mustCulture.size()==count) {
				s2.add(re);
			}
		}
		
		stu.setS2(requiredCultureSubject);
			
		return stu;
	}
	

	
}
