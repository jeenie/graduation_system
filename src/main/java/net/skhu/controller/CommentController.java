package net.skhu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import net.skhu.mapper.CommentMapper;

@Controller
public class CommentController {
	@Autowired CommentMapper commentMapper;
}
