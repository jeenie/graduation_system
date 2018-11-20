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


import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.Master;
import net.skhu.dto.MyCell;
import net.skhu.dto.PasswordQuiz;
import net.skhu.dto.Professor;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.MyCellMapper;
import net.skhu.mapper.PasswordQuizMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.mapper.StudentGradefileMapper;
import net.skhu.utils.Encryption;

@RequestMapping("/user")
@Controller
public class EditController {
	private String fileLocation;
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	ProfessorMapper professorMapper;
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

	@RequestMapping(value="studentEdit", method=RequestMethod.GET)
	public String edit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Student student = studentMapper.findById(userNumber);
		List<Department> departments = departmentMapper.findAll();
		List<PasswordQuiz> quizs = passwordQuizMapper.findAll();
		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		model.addAttribute("quizs", quizs);
		return "edit/studentEdit";
	}

	@RequestMapping(value="studentEdit", method=RequestMethod.POST)
	public String edit(Model model, Student student) throws IOException, ParseException {
		User user = userMapper.findOne(student.getId());
		student.setPassword(Encryption.encrypt(student.getPassword(), Encryption.MD5));
		student.setPassword2(Encryption.encrypt(student.getPassword2(), Encryption.MD5));
		user.setPassword(student.getPassword());
		userMapper.update(user);
		studentMapper.update(student);
		
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
		List<MyCell> data = new ArrayList<MyCell>(); // 
		int rowMax = sheet.getPhysicalNumberOfRows();
		
		for(int rowIndex = 2; rowIndex<rowMax; rowIndex++) {
			XSSFRow row = (XSSFRow) sheet.getRow(rowIndex);
			int cellMax = row.getLastCellNum();
			
			List<Object> list = new ArrayList<Object>();
			MyCell myCell = new MyCell();
			
			list.add(student.getId());
			myCell.setId(student.getId());
			
			
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
			

			myCell.setYearOfClass((int)list.get(1));
			myCell.setYearOfSemester((String)list.get(2));
			myCell.setSubjectId((String)list.get(3));
			myCell.setCompleteType((String)list.get(5));
			myCell.setSubjectScore((int)list.get(6));
			myCell.setGrade((String)list.get(7));
			
			
			data.add(myCell);
			
		}
		
		myCellMapper.delete(student.getId());
		studentGradefileMapper.delete(student.getId());
		myCellMapper.insert(data);
		

		StudentGradefile studentGradefile = new StudentGradefile();
		int totalUnit=0; int majorUnit=0; int cultureUnit=0; float totalGrade=0; float totalAvgGrade=0; int majorexUnit=0;
		String str; int num;
		for(MyCell myCell : myCellMapper.findAllById(student.getId())) {
			totalGrade += myCell.getScore(); 
			str = myCell.getCompleteType();
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
		
		return "redirect:index";
	}

	@RequestMapping(value="professorEdit", method=RequestMethod.GET)
	public String professorEdit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Professor professor = professorMapper.findById(userNumber);
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("professor", professor);
		model.addAttribute("departments", departments);
		return "edit/professorEdit";
	}

	@RequestMapping(value="professorEdit", method=RequestMethod.POST)
	public String professorEdit(Model model, Professor professor) {
		User user = userMapper.findOne(professor.getId());
		professor.setPassword(Encryption.encrypt(professor.getPassword(), Encryption.MD5));
		user.setPassword(professor.getPassword());
		userMapper.update(user);
		professorMapper.update(professor);
		return "redirect:index";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.GET)
	public String adminEdit(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		int userNumber=Integer.parseInt(authentication.getName());

		Master master = masterMapper.findById(userNumber);
		model.addAttribute("master", master);
		return "edit/adminEdit";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.POST)
	public String adminEdit(Model model, Master master) {
		User user = userMapper.findOne(master.getId());
		master.setPassword(Encryption.encrypt(master.getPassword(), Encryption.MD5));
		user.setPassword(master.getPassword());
		userMapper.update(user);
		masterMapper.update(master);
		return "redirect:index";
	}
}
