package net.skhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuestCotroller {
	@RequestMapping({"/", "guest/index"})
    public String index() {
        return "guest/index";
    }

	@RequestMapping("guest/login")
    public String login() {
        return "guest/login";
    }
}
