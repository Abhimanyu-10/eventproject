<%-- 
    Document   : contact
    Created on : Nov 27, 2018, 3:07:59 PM
    Author     : Abhimanyu Thakur
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
           String username=request.getParameter("username");
           String email=request.getParameter("email");
           String subject=request.getParameter("subject");
           String message=request.getParameter("message");
           
           Connection conn=null;
           Statement st=null;
           ResultSet rs=null;
           try
             {
                String myUrl="jdbc:mysql://localhost/contact";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                st.executeUpdate("insert into feedback values('"+username+"','"+email+"','"+subject+"','"+message+"')");              
                out.println("<script>window.location.href='login.html';</script>");
            }
            catch(Exception e)
            {                
                out.println(e);   
            }
        %>
    </body>
</html>
