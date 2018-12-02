<%-- 
    Document   : login
    Created on : Nov 26, 2018, 1:16:05 PM
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
            String email =request.getParameter("email");
           String pwd=request.getParameter("pwd");
           try
           {
	
               String myUrl="jdbc:mysql://localhost/event";
		//step 1:
		Class.forName("com.mysql.jdbc.Driver");
      		//step 2:
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String query="Select Email,Password from users where Email= '"+email+"' and Password='"+pwd+"'";
		//step 3:
		Statement st=conn.createStatement();
		//step 4:
		ResultSet rs =st.executeQuery(query);
		if(rs.next()){
			String redirectURL = "main.html";
                        response.sendRedirect(redirectURL);

		}  
                else
                {
                    String a = "Invalid.html";
                    response.sendRedirect(a);
                }
		//step 5
		st.close();
		}
		catch(Exception e){
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
           
        %>
    </body>
</html>
