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

import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.StudentSubstitutionMapper;

@Controller
@RequestMapping("student/")
public class StudentSubstitutionController {

	@Autowired StudentSubstitutionMapper studentSubstitutionMapper;

	@RequestMapping("status")
	public String selectStatus(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
        List<SubstitutionSubject> substiStatus = studentSubstitutionMapper.findSubstiStatus(userNumber);
		model.addAttribute("substiStatus",substiStatus);
        return "student/detailStatus";
    }

	@RequestMapping("otherMajor")
	public String selectOtherMajor() {
        return "student/otherMajorEdit";
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
		model.addAttribute("abolitionId", abolitionId);
		return "student/substituteEdit";
    }

}
