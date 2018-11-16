package net.skhu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import net.skhu.dto.User;
import net.skhu.dto.MyCell;
import net.skhu.mapper.DepartmentMapper;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.PasswordQuizMapper;
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
		//Map<Integer, List<Object>> data = new HashMap<>();
		
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
				XSSFCell cell = row.getCell(cellIndex); //셀을 얻는다.
				switch(cell.getCellTypeEnum()) {
				case NUMERIC:
					list.add(((int)cell.getNumericCellValue()));
					break;
				case STRING:
					list.add(cell.getStringCellValue());
					break;
				default:
					list.add(" ");
					
					
				}
				/*
				if(cellIndex==3 || cellIndex==5) continue;
				else if(cellIndex==0) { //년도
					myCell.setYearOfClass((int)cell.getNumericCellValue()); 
					
				}
				else if(cellIndex==1) { //학기
					myCell.setYearOfSemester((int)cell.getNumericCellValue());
					
				}
				else if(cellIndex==2) { //과목코드
					myCell.setSubjectId(cell.getStringCellValue());
					
				}
				else if(cellIndex==4) { //이수구분
					myCell.setCompleteType(cell.getStringCellValue());
					
				}
				else if(cellIndex==6) { //성적등급
					myCell.setGrade(cell.getStringCellValue());
					data.add(myCell);
				}
				else {
					throw new IOException("incorrect data format");
				}
				*/
			}
		
				/*
				switch(cell.getCellTypeEnum()) {
				case NUMERIC:
					
					//list.add(((int)cell.getNumericCellValue()));
					break;
				case STRING:
					list.add(cell.getStringCellValue());
					break;
				case FORMULA:
					list.add(cell.getCellFormula()+"");
					break;
				default:
					list.add("");
				}
				*/
			
			myCell.setYearOfClass((int)list.get(2));
			myCell.setYearOfSemester((int)list.get(3));
			myCell.setSubjectId((String)list.get(4));
			myCell.setSubjectName((String)list.get(5));
			myCell.setCompleteType((String)list.get(6));
			myCell.setSubjectScore((int)list.get(7));
			myCell.setGrade((String)list.get(8));
			
			data.add(myCell);
			
				
		}
		/*
		Map<Integer, List<String>> data = new HashMap<>();
		int i = 0;
		for(Row row : sheet) {
			data.put(i, new ArrayList<String>());
			for(Cell cell : row) {
				switch(cell.getCellTypeEnum()) {
				case STRING:
					data.get(new Integer(i)).add(cell.getRichStringCellValue().getString());
					break;
				
				case NUMERIC:
					data.get(i).add(cell.getNumericCellValue()+"");
					break;
				case FORMULA:
					data.get(i).add(cell.getCellFormula()+"");
				default:
					data.get(new Integer(i)).add(" ");
				}
			}
			i++;
		}
		*/
	
		
		myCellMapper.insert(data);
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
