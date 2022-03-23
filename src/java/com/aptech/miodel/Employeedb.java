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
import java.sql.ResultSet;
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
    
    public int Users(Register register) throws ClassNotFoundException{
        int result = 0;
          Class.forName("com.mysql.jdbc.Driver");
          String INSERT = "insert into usertable(email,password)VALUES(?,?)";
          
          try{
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aptechjsp?useSSL=false","root","");
              PreparedStatement ps = con.prepareStatement(INSERT);
              ps.setString(1, register.getEmail());
              ps.setString(2, register.getPassword());
              result = ps.executeUpdate();
              
              
          }catch(SQLException e){}
     return result;  
    }
    
    public boolean UserLogin(Register register) throws ClassNotFoundException{
         Class.forName("com.mysql.jdbc.Driver");
         boolean status =  false;
          String SELECT = "select * from usertable where email=? AND password=?";
          
          try{
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aptechjsp?useSSL=false","root","");
              PreparedStatement ps = con.prepareStatement(SELECT);
              ps.setString(1, register.getEmail());
              ps.setString(2,register.getPassword());
              ResultSet rs = ps.executeQuery();
              status = rs.next();
             
          }catch(Exception e){}
          
          return status;
    }
    
}
