package com.ezen.FSB;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DirectMessageController {

	@RequestMapping(value = "/dm_main.do")
	public String main() {
		return "dm/dm_main";
	}
}
