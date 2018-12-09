package net.skhu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.dto.Professor;
import net.skhu.mapper.ProfessorMapper;

@Controller
public class UserController {
	@Autowired ProfessorMapper professorMapper;
	
    @RequestMapping("user/index")
    public String index(Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	if(!authentication.getName().equals("master")) {
	    	int userNumber = Integer.parseInt(authentication.getName());
	    	if(professorMapper.findById(userNumber) != null) {
				Professor professor = professorMapper.findById(userNumber);
				if(professor.getEmail().equals("설정 필요")) {
					return "redirect:professorEdit";
				}
				
			} 
    	}
        return "user/index";
    }
}
