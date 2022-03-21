/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.miodel;

import com.aptech.employee.Register;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class Employeedb {
    
    public int Signup(Register register) throws SQLException{
        int outcome = 0;
        try{
               
                
               String INSERT = "INSERT INTO employee(firstname,lastname,password,email) VALUES"
                       + "(?,?,?,?)";
                Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aptechjsp?useSSL=false","root","");
                PreparedStatement ps =  con.prepareStatement(INSERT);
                ps.setString(1, register.getFirtsname());
                ps.setString(2, register.getLastname());
                ps.setString(3, register.getPassword());
                ps.setString(4, register.getEmail());
                outcome = ps.executeUpdate();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        return outcome;
    }
}
