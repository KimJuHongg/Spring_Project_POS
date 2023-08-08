package com.example.demo;

public class Member {
private String id;
private String password;
private String name;
private String grade;

public Member(String id, String name, String password, String grade) {
    this.id = id;
    this.password = password;
    this.grade = grade;
    this.name = name;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getGrade() {
	return grade;
}

public void setGrade(String grade) {
	this.grade = grade;
}

}