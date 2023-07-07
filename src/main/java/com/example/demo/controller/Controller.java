package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Entity;
import com.example.demo.repo.EntityRepo;
import com.example.demo.repo.LoginRepo;

import jakarta.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired
	private EntityRepo repo;
	@Autowired
	private LoginRepo repo2;
	
	@GetMapping("/home")
	public String msg() {
		return "login";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "insert";
	} 
	
	@PostMapping("/insertData")
	public String insertData(@RequestParam String empName,String empLoc,Model model) {
		Entity entity=new Entity(empName,empLoc);
		repo.save(entity);
		model.addAttribute("msg", "Data Insert successfully....(:");
		model.addAttribute("get", repo.findAll());
		return "home";
	}
	@GetMapping("/edit")
	public String edit(@RequestParam("id") String id, Model model) {
		model.addAttribute("data", repo.findById(Integer.parseInt(id)).get());
		return "edit";
	}
	@PostMapping("/update")
	public String update(@RequestParam int empId,String empName,String empLoc,Model model) {
		Entity entity=new Entity(empId,empName,empLoc);
		repo.save(entity);
		model.addAttribute("get", repo.findAll());
		model.addAttribute("msg", "Data Updated successfully....(:");
		return "home";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id")int id,Model model){
		repo.deleteById(id);
		model.addAttribute("get", repo.findAll());
		model.addAttribute("mmssgg", "Data Deleted successfully....):");
		return "home";
	}
	
	@PostMapping("/login")
	public String check(@RequestParam String email,String pswd,HttpSession session,Model model){
		if(repo2.findByEmail(email,pswd) != null) {
			session.setAttribute("email",email);
			return "redirect:check2";
		}else {
			 model.addAttribute("msg", "Invalid Credentials....!!");
			 return "login";
		}	
	}
	
	@GetMapping("/check2")
	public String che(HttpSession session,Model model) {
			model.addAttribute("get", repo.findAll());
			return "home";
	}
	
	@GetMapping("/logout")
	public String check(HttpSession session) {
		session.removeAttribute("email");
		session.invalidate();
		return "login";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@RequestBody Entity entity)
	{
		repo.save(entity);
		return "User id "+entity.getId()+" Insert successfully";
	}
		
	@GetMapping("/getUser")
	public String getUser(){
		repo.findAll();
		return "home";
	}

}