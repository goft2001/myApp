package com.exam01;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import java.util.StringTokenizer;

public class StudentManager {
	
   static Scanner sc = new Scanner(System.in);
   ArrayList<Student> arr = new ArrayList<Student>();
	 File dir;
	 File file;
	 public StudentManager () throws IOException, ClassNotFoundException {
		dir = new File("src\\com\\exam01");
		file = new File(dir, "exam02.txt");
		if(file.exists()) {
			ObjectInputStream ois =new ObjectInputStream(new FileInputStream(file));
			arr = (ArrayList<Student>)ois.readObject();
		}else { 
			file.createNewFile();
					}
	 }
	 

public static void showMenu() {
	   
		System.out.println("선택하세요...");
		System.out.println("1. 학생정보 입력");
		System.out.println("2. 학생 전체보기");
		System.out.println("3. 학생 찾기");
		System.out.println("4. 저장/종료");
		System.out.print("선택 >>");
   }
   public void inputData() {
	   while(true) {
		   System.out.println("학생 이름,학과,학번,학점평균 입력하세요.(입력은 , 로 구분하고 종료는 x)");
		   System.out.print(">> ");
		   String text = StudentManager.sc.nextLine();
		   if(text.toLowerCase().equals("x")) {
			   System.out.println("입력종료");
			   break;
		   }
		   StringTokenizer st = new StringTokenizer(text, ",");
		   String name = st.nextToken();//이름
		   String dept = st.nextToken(); //학과
		   String id = st.nextToken();//학번
		   double grade =Double.parseDouble(st.nextToken()); //학점
		   arr.add(new Student(name, dept, id, grade));
	   }
   }
	 public void viewData() {
		 System.out.println("학생전체리스트.....");
		 for(Student student : arr) {
				System.out.println("이름:" + student.getName());
				System.out.println("학과:" + student.getDepartment());
				System.out.println("학번:" + student.getId());
				System.out.println("학점평균:" + student.getGrade());
				System.out.println("---------------------------");
		 }
		   
	   }
	 public void searchData() {
		 System.out.println("학생 찾기....");
		 System.out.println("찾을 학생 이름 >>");
		 String searhName = StudentManager.sc.next();
		 Student s = search(searhName);
		 if(s==null) {
			 System.out.println("찾는 학생 없음");
			 return;
		 }
		 System.out.println("이름:" + s.getName());
		System.out.println("학과:" + s.getDepartment());
		System.out.println("학번:" + s.getId());
		System.out.println("학점평균:" + s.getGrade());
	 }
	 private Student search(String searhName) {
		 for(int i=0;i<arr.size();i++) {
			 if(searhName.equals(arr.get(i).getName())) {
				 return arr.get(i);
			 }
		 }
		 return null;
	 }
	 public void saveData() throws FileNotFoundException, IOException {
		 ObjectOutputStream oos =  new ObjectOutputStream(new FileOutputStream(file));
		 oos.writeObject(arr);
		 System.out.println("종료");
		 System.exit(0);
			   
	 }

	public static void main(String[] args) throws FileNotFoundException, IOException, ClassNotFoundException {
		StudentManager sm = new StudentManager();
		while(true) {
			StudentManager.showMenu();
			int num = sc.nextInt();
			sc.nextLine();
			switch(num) {
			case 1: sm.inputData(); break;
			case 2: sm.viewData(); break;
			case 3: sm.searchData(); break;
			case 4: sm.saveData();
			   System.out.println("프로그램 종료");
			   System.exit(0);
			default : System.out.println("입력오류");
			}
			
		}

	}

}
