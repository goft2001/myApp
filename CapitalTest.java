package com.exam02;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

import com.exam02.CapitalTestMain;

public class CapitalTest {
	private HashMap<String,String> map    = new HashMap<String, String>();
    File dir, file;
    public CapitalTest() {
    	dir = new File("src\\com\\exam02");
    	file = new File(dir, "myCapital.txt");
    	map.clear();
    	try {
	    	if(!file.exists()) { 
	    			file.createNewFile();
					return;
		   	} 
	    	Scanner scanner = new Scanner(file);
	    	while(scanner.hasNext()) {
	    		String country = scanner.next(); 
	    		String capital = scanner.next() ;
	    		map.put(country, capital);
	    	}
	    	scanner.close();
		}catch (IOException e) {
			e.printStackTrace();
    	}
    }
	private void input() {
	  System.out.println("현재 " +map.size() +" 개 나라와 수도 입력");
		while(true) {
			System.out.println("나라와 수도 입력(종료는  x)>>");
			String cont = CapitalTestMain.sc.next(); 
			if(cont.toUpperCase().equals("X")) break;
				if(map.containsKey(cont)) { 
				System.out.println("이미 입력한 나라입니다.");
				continue;
			}
			String sudo = CapitalTestMain.sc.next();
			 map.put(cont, sudo);
		}
  }
  private void quiz() {
		Set<String>  set = map.keySet();
		
		Object[] arr = set.toArray(); 
		while(true) {
			int n = (int)(Math.random()*map.size());
			if(map.isEmpty()) return;
			String 	city=(String) arr[n];
			String dosi = map.get(city);
		    
		   
		    System.out.println(city +" 의 수도는 ? 종료는 x >>");
		    String answer =CapitalTestMain. sc.next();
		    if(answer.toLowerCase().equals("x")) break;
		    if(answer.equals(dosi)) {
		    	System.out.println("정답");
		    }else {
		    	System.out.println("틀렸습니다.");
		    }
		    
  		}
  }
 
  private void save() {
	  FileWriter fw=null;
	 
	  try {
		 fw = new FileWriter(file);
		 Set<String> set =map.keySet();  
		 Iterator<String> it = set.iterator();
		   while(it.hasNext()) {
			   String key = it.next(); 
			   String value = map.get(key) ;
			   fw.write(key+"  "); 
			   fw.write(value+"\n"); 
		   }
		   fw.close();
		   System.out.println("종료");
		   System.exit(0);
		
	} catch (IOException e) {
		e.printStackTrace();
		System.out.println("파일저장 오류");
	}
	  
	  
	  
  }
	public static void main(String[] args) {
		CapitalTest ca2 = new CapitalTest();
		while(true) {
			CapitalTestMain.showMenu();
			int choice = CapitalTestMain.sc.nextInt();
			switch (choice) {
			case 1 : ca2.input();	break;
			case 2 : ca2.quiz(); break;
			case 3 : ca2.save(); break;
			default: System.out.println("입력오류");
			}
			
		}
	}

}
