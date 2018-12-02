<%-- 
    Document   : signup
    Created on : Nov 26, 2018, 1:15:55 PM
    Author     : Abhimanyu Thakur
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup</title>
    </head>
    <body>
       
         <%
           String fname=request.getParameter("fname");
           String lname=request.getParameter("lname");
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           
           Connection conn=null;
           Statement st=null;
           ResultSet rs=null;
           try
             {
                String myUrl="jdbc:mysql://localhost/event";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                st.executeUpdate("insert into users values('"+fname+"','"+lname+"','"+email+"','"+password+"')");              
                out.println("<script>window.location.href='login.html';</script>");
            }
            catch(Exception e)
            {                
                out.println(e);   
            }
        %>
    </body>
</html>
