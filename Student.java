package com.exam01;

import java.io.Serializable;

public class Student implements Serializable{
	private String name;
	private String department;
	private String id;
	private double grade;
	
	public Student(String name, String dept, String  id, 	double grade) {
		this.name = name;
		this.department = dept;
		this.id =id;
		this.grade = grade;
	}

	public String getName() {
		return name;
	}

	public String getDepartment() {
		return department;
	}

	public String getId() {
		return id;
	}

	public double getGrade() {
		return grade;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}
}