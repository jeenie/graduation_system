package net.skhu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Comment;
import net.skhu.mapper.CommentMapper;

@Controller
@RequestMapping("/user")
public class CommentController {
	@Autowired CommentMapper commentMapper;
	
	@RequestMapping(value="addComment", method=RequestMethod.POST)
	public String saveComment(Model model, @RequestParam("studentId") int studentId, @RequestParam("comment") String comment) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());
		
		SimpleDateFormat format1 = new SimpleDateFormat("yy-mm-dd");
		Comment com = new Comment();
		com.setProfessorId(userNumber);
		com.setStudentId(studentId);
		com.setComment(comment);
		com.setDateWritten(format1.format(new Date()));
		
		commentMapper.insert(com);
		
		return "redirect:studentListForProfessor";
	}
}
