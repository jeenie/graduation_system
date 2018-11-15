package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.SubstitutionSubject;
import net.skhu.mapper.StudentSubstitutionMapper;

@Controller
@RequestMapping("student/substitute")
public class StudentSubstitutionController {

	@Autowired StudentSubstitutionMapper studentSubstitutionMapper;

    @RequestMapping(value="abolition", method=RequestMethod.GET)
    public String abolitionList(Model model) {
    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        int userNumber=Integer.parseInt(authentication.getName());
	    List<SubstitutionSubject> abolitionList = studentSubstitutionMapper.findLowGradeAbosub(userNumber);
		model.addAttribute("abolitionList",abolitionList);
		return "student/substituteEdit";
    }
}