package net.skhu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/guest")
public class CoreController {
	@RequestMapping(value="exexex", method=RequestMethod.GET)
	public String ex() {
		String coreJson = "[\r\n" + 
				"    { \"label\" : \"핵심역량\",         \"itemId\" : \"root\",     \"parentId\" : \"999\",     \"order\" : \"1\" },\r\n" + 
				"    { \"label\" : \"가치역량\",         \"itemId\" : \"role1\",    \"parentId\" : \"root\",    \"order\" : \"2\" },\r\n" + 
				"    { \"label\" : \"인간·인권\",     \"itemId\" : \"role11\",   \"parentId\" : \"role1\",   \"order\" : \"3\" },\r\n" + 
				"    { \"label\" : \"생명·평화\",     \"itemId\" : \"role12\",   \"parentId\" : \"role1\",   \"order\" : \"4\" },\r\n" + 
				"    { \"label\" : \"민주시만\",     \"itemId\" : \"role13\",   \"parentId\" : \"role1\",   \"order\" : \"5\" },\r\n" + 
				"    { \"label\" : \"대안역량\",	    \"itemId\" : \"role2\",    \"parentId\" : \"root\",    \"order\" : \"6\" },\r\n" + 
				"    { \"label\" : \"융·복합적 사고\",     \"itemId\" : \"role21\",   \"parentId\" : \"role2\",   \"order\" : \"7\" },\r\n" + 
				"    { \"label\" : \"조사·분석·정보활용\",     \"itemId\" : \"role22\",   \"parentId\" : \"role2\",   \"order\" : \"8\" },\r\n" + 
				"    { \"label\" : \"대안제시·문제해결\",     \"itemId\" : \"role23\",   \"parentId\" : \"role2\",   \"order\" : \"9\" },\r\n" + 
				"    { \"label\" : \"실천역략\",	    \"itemId\" : \"role3\",    \"parentId\" : \"root\",    \"order\" : \"10\" },\r\n" + 
				"    { \"label\" : \"민주적 소통\",     \"itemId\" : \"role31\",   \"parentId\" : \"role3\",   \"order\" : \"11\" },\r\n" + 
				"    { \"label\" : \"연대와 공동체적 실천\",     \"itemId\" : \"role32\",   \"parentId\" : \"role3\",   \"order\" : \"12\" }\r\n" + 
				"]";
		return coreJson;
	}
}
