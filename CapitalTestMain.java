package com.exam02;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

public class CapitalTestMain {
	public static Scanner sc = new Scanner(System.in);
	private HashMap<String,String> map =new HashMap<String,String>();
	public CapitalTestMain() {
	map.put("한국","서울");
	map.put("일본","동경");
	map.put("중국","베이찡");
	map.put("미국","워싱턴");
	map.put("영국","런던");
	map.put("프랑스","파리");
	map.put("독일","베를린");
	
	}
 public	static void showMenu() { 
		System.out.println( "********수도 맞추기 게임을 시작합니다.*********");
		System.out.println("1. 입력, 2. 퀴즈, 3. 파일저장 및 종료");
	}
	
private void input() {
	System.out.println("현재 " +map.size() + "개 나라와 수도 입력");
	while(true){
		System.out.println("나라와 수도 입력 (종료는 x) >>");
		String cont = sc.next();
		if(cont.toUpperCase().contentEquals("X"))	break;
		
		if(map.containsKey(cont)) {
			System.out.println("이미 입력한 나라입니다.");
			continue;
		}
		String sudo =sc.next();
		map.put(cont, sudo);
	}
		
	}

	private void test() {
		Set<String> set = map.keySet();

		Object[] arr = set.toArray(); 
		while(true) {
			int n = (int)(Math.random()*map.size());
			
			String city = (String)arr[n] ;
			String dosi = map.get(city); 
			

			System.out.println(city + " 의 수도는? 종료는 x >>");
			String ct = sc.next();
			if(ct.toLowerCase().equals("x")) break;
			if(ct.equals(dosi)) {
				System.out.println("정답");
				
			}else {
				System.out.println("오답");
			}
		}
	}


	public static void main(String[] args) {
		CapitalTestMain ca = new CapitalTestMain();
		while(true)	 {
			CapitalTestMain.showMenu();
			int choice = sc.nextInt();
			switch(choice) { 
			case 1 : ca.input(); break;
			case 2 : ca.test(); break;
			case 3 : System.out.println("종료");
						System.out.println(0);
			default : System.out.println("입력오류");
			}
		}

	}

}
