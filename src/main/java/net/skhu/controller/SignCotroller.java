package net.skhu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.dto.Department;
import net.skhu.dto.Master;
import net.skhu.dto.PasswordQuiz;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.User;
import net.skhu.dto.MyCell;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.StudentGradefileMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.mapper.MyCellMapper;
import net.skhu.utils.Encryption;



@RequestMapping("/guest")
@Controller
public class SignCotroller {

	private String fileLocation;
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	MasterMapper masterMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	PasswordQuizMapper passwordQuizMapper;
	@Autowired
	MyCellMapper myCellMapper;
	@Autowired
	StudentGradefileMapper studentGradefileMapper;

	@RequestMapping(value="sign", method = RequestMethod.GET)
	public String sign(Model model) {
		Student student = new Student();
		List<Department> departments = departmentMapper.findAll();
		List<PasswordQuiz> quizs = passwordQuizMapper.findAll();

		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		model.addAttribute("quizs", quizs);
		return "guest/sign";
	}

	@RequestMapping(value="sign", method = RequestMethod.POST)
	public String sign(Model model, Student student) throws IOException, ParseException {
		User user = new User();
		user.setUserId(student.getId());
		student.setPassword(Encryption.encrypt(student.getPassword(), Encryption.MD5));
		student.setPassword2(Encryption.encrypt(student.getPassword2(), Encryption.MD5));
		user.setPassword(student.getPassword());
		user.setUserType("학생");
		userMapper.insert(user);
		studentMapper.insert(student);
		
		InputStream in = student.getFile().getInputStream();
		File currDir = new File(".");
		String path = currDir.getAbsolutePath();
		fileLocation = path.substring(0,path.length()-1) + student.getFile().getOriginalFilename();
		FileOutputStream f = new FileOutputStream(fileLocation);
		int ch = 0;
		while((ch = in.read()) != -1) {
			f.write(ch);
		}
		f.flush();
		f.close();
		
		FileInputStream uploadFile = new FileInputStream(new File(fileLocation));
		Workbook workbook = new XSSFWorkbook(uploadFile); //xlsx
		Sheet sheet = workbook.getSheetAt(0);
		List<MyCell> data = new ArrayList<MyCell>();
		int rowMax = sheet.getPhysicalNumberOfRows();
		
		for(int rowIndex = 2; rowIndex<rowMax; rowIndex++) {
			XSSFRow row = (XSSFRow) sheet.getRow(rowIndex);
			int cellMax = row.getLastCellNum();
			
			List<Object> list = new ArrayList<Object>();
			MyCell myCell = new MyCell();
			
			list.add(student.getId());
			myCell.setId(student.getId());
			
			Date myDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(myDate);
			Date dt = sdf.parse(strToday);
			
			list.add(dt);
			myCell.setLatestUpdateDate(dt);
			
			
			for(int cellIndex=0; cellIndex<cellMax; cellIndex++) {
				XSSFCell cell = row.getCell(cellIndex); 
				switch(cell.getCellTypeEnum()) {
				case NUMERIC:
					list.add(((int)cell.getNumericCellValue()));
					break;
				case STRING:
					list.add((String)cell.getStringCellValue());
					break;
				default:
					list.add(" ");
					break;
					
				}
			}
			
			myCell.setYearOfClass((int)list.get(2));
			myCell.setYearOfSemester((int)list.get(3));
			myCell.setSubjectId((String)list.get(4));
			myCell.setSubjectName((String)list.get(5));
			myCell.setCompleteType((String)list.get(6));
			myCell.setSubjectScore((int)list.get(7));
			myCell.setGrade((String)list.get(8));
			
			data.add(myCell);
			
		}
	
		myCellMapper.insert(data);
		
		StudentGradefile studentGradefile = new StudentGradefile();
		int totalUnit=0; int majorUnit=0; int cultureUnit=0; float totalGrade=0; float totalAvgGrade=0; int majorexUnit=0;
		String str; int num;
		for(MyCell myCell : myCellMapper.findAllById(student.getId())) {
			totalGrade += myCell.getScore();
			str = myCell.getCompleteType();
			System.out.println(str);
			num = myCell.getSubjectScore();
			if(myCell.getGrade() != "F") totalUnit += num;
			if(str.equals("전필") || str.equals("전선")) majorUnit += num;
			if(str.equals("교필") || str.equals("교선")) cultureUnit += num;
			if(str.equals("전탐")) majorexUnit += num;
			
		}
		totalAvgGrade = totalGrade/(myCellMapper.findAllById(student.getId()).size()+1);
		double totalAvgGrade2 = Math.round(totalAvgGrade*10d)/10d;
		
		Date myDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(myDate);
		Date dt = sdf.parse(strToday);
		
		studentGradefile.setId(student.getId());
		studentGradefile.setLatestUploadDate(dt);
		studentGradefile.setTotalUnit(totalUnit);
		studentGradefile.setMajorUnit(majorUnit);
		studentGradefile.setCultureUnit(cultureUnit);
		studentGradefile.setTotalAvgGrade((float)totalAvgGrade2);
		studentGradefile.setMajorexUnit(majorexUnit);
		
		studentGradefileMapper.insert(studentGradefile);
		
		workbook.close();
		
		return "redirect:login";
	}

	@RequestMapping(value="adminsign", method = RequestMethod.GET)
	public String adminsign(Model model) {
		Master master = new Master();
		model.addAttribute("master", master);
		return "guest/mastersign";
	}

	@RequestMapping(value="adminsign", method = RequestMethod.POST)
	public String adminsign(Model model, Master master) {
		User user = new User();

		user.setUserId(master.getId());
		master.setPassword(Encryption.encrypt(master.getPassword(), Encryption.MD5));
		user.setPassword(master.getPassword());
		user.setUserType("관리자");
		userMapper.insert(user);
		masterMapper.insert(master);

		return "redirect:login";
	}
	

}
