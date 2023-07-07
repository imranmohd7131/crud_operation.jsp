package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.Login;

public interface LoginRepo extends JpaRepository<Login, String>{
	
//	Login findByEmail(String email);
//	Login findByPswd(String pswd);
	
	@Query(value="SELECT email,pswd FROM tbl_login WHERE email=?1 AND pswd=?2",nativeQuery = true)
	Login findByEmail(String email,String pswd);
}
