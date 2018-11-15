package net.skhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatusController {
	@RequestMapping("student/status")
	public String selectStatus() {
        return "student/detailStatus";
    }

	@RequestMapping("student/substitute")
	public String selectSubstitute() {
        return "student/substituteEdit";
    }

	@RequestMapping("student/otherMajor")
	public String selectOtherMajor() {
        return "student/otherMajorEdit";
    }

}
