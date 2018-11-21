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
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.OtherMajorMapper;
import net.skhu.mapper.StudentSubjectGradeMapper;
import net.skhu.mapper.StudentSubstitutionMapper;
@Controller
@RequestMapping("student/")
public class StudentSubstitutionController {

	@Autowired StudentSubstitutionMapper studentSubstitutionMapper;
	@Autowired OtherMajorMapper otherMajorMapper;
	@Autowired StudentSubjectGradeMapper studentSubjectGradeMapper;

	@RequestMapping("status")
	public String selectStatus(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        List<SubstitutionSubject> substiStatus = studentSubstitutionMapper.findSubstiStatus(userNumber);
        List<OtherMajor> majorStatus = otherMajorMapper.otherMajorStatus(userNumber);
		model.addAttribute("substiStatus",substiStatus);
		model.addAttribute("majorStatus",majorStatus);
        return "student/detailStatus";
    }

    @RequestMapping(value="substitute/abolition", method=RequestMethod.GET)
    public String abolitionList(Model model) {
    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
	    List<SubstitutionSubject> abolitionList = studentSubstitutionMapper.findLowGradeAbosub(userNumber);
		model.addAttribute("abolitionList",abolitionList);
		return "student/substituteEdit";
    }

    @RequestMapping(value="substitute/sublist", method=RequestMethod.GET)
    public String substitutionList(Model model, @RequestParam("abolitionId") String abolitionId) {
    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
    	List<SubstitutionSubject> abolitionList = studentSubstitutionMapper.findLowGradeAbosub(userNumber);
		model.addAttribute("abolitionList",abolitionList);
	    List<SubstitutionSubject> substitutionList = studentSubstitutionMapper.findSubstiByAbosub(abolitionId);
		model.addAttribute("substitutionList",substitutionList);
		List<StudentSubjectGrade> studentSubjectList = studentSubjectGradeMapper.findSubjectIdList(userNumber);
		model.addAttribute("studentSubjectList",studentSubjectList);
		model.addAttribute("abolitionId", abolitionId);
		return "student/substituteEdit";
    }

    @RequestMapping(value="substitute/insert", method=RequestMethod.GET)
    public String Substiinsert(Model model, @RequestParam("abolitionId") String abolitionId, @RequestParam("substitutionId") String substitutionId) {
    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        List<SubstitutionSubject> abolitionList = studentSubstitutionMapper.findLowGradeAbosub(userNumber);
		model.addAttribute("abolitionList",abolitionList);
	    List<SubstitutionSubject> substitutionList = studentSubstitutionMapper.findSubstiByAbosub(abolitionId);
		model.addAttribute("substitutionList",substitutionList);
		model.addAttribute("abolitionId", abolitionId);
        model.addAttribute("substitutionId",substitutionId);
        studentSubstitutionMapper.insert(userNumber,abolitionId,substitutionId); //학생 대체과목 현황 테이블에 추가
        studentSubstitutionMapper.delete(userNumber,abolitionId); //학생 성적 테이블에서 폐지과목 성적 삭제
        return "redirect:/student/status";
    }

}
