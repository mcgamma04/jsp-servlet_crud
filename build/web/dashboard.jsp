<%-- 
    Document   : dashboard
    Created on : Mar 23, 2022, 2:44:53 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       
        <style>
        a{
        color:white;
        }
        </style>
    </head>
    <body>
        
        <% 
            //HttpSession session = request.getSession();
  String email =(String) session.getAttribute("email");
        %>
        <h3>You are welcome <%= email %></h3>
        <div style="width:600px;">
        <table class="table table-striped">
            <tr>
            <th>First Name</th>
             <th>Last Name</th>
              <th>Email</th>
              <th colspan="2">ACTION</th>
            </tr>
            
                <% 
                Class.forName("com.mysql.jdbc.Driver");
                String select = "SELECT * from employee where email=?";
                String fname="";
                String lname = "";
                String ema = "";
                int id = 0;
                try{
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aptechjsp?useSSL=false","root","");
                   PreparedStatement ps =  con.prepareStatement(select);
                   ps.setString(1, email);
                   ResultSet result =  ps.executeQuery();
                   while(result.next()){
                       fname = result.getString("firstname");
                       lname = result.getString("lastname");
                       ema =  result.getString("email");
                       id = result.getInt("id");
                }
                }catch(SQLException e){ }
                
                %>
                <tr>
                    <td><%= fname %></td>
                    <td><%= lname %></td>
                    <td><%= ema %></td>
                    <td><a href="delete.jsp?del=<%= id %>"><button class="btn btn-danger">Delete</a></button></td>
                    <td><a href="edituser.jsp?edit=<%= id %>"><button class="btn btn-primary text-white">Update</a></button></td>
                </tr>
            
</table>
                </div>
</html>
