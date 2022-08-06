<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Orders : onlyxscript.blogspot.com</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">

</head>

	


<body>
	<ul>
        <li><a href="http://192.168.56.20:10200/capstone/home.html">Capstone Customer Portal</a></li>
    	</ul>
	
	<div class="main-content">
	
	<form method="post">
		
		<div class="form-white-background">

	  		<table border="2">
   				<tr>
	        			 <div class="form-row">
					 <label> 
						<td>ID</td>
						<td>First Name</td>
						<td>Last Name</td>
						<td>Email</td>
					</label>
					</div>
				</tr>
		
		<%
   		try
   		{
       			Class.forName("com.mysql.jdbc.Driver");
      			String query="select * from login ";
       			Connection con=DriverManager.getConnection("jdbc:mysql://mysql-standalone:3306/water_services","rahul","wipro@1234");
       			Statement stmt=con.createStatement();
       			ResultSet rs=stmt.executeQuery(query);
       			while(rs.next())
       			{
   		%>

            		<tr>

		    		<td><%out.println(rs.getInt("id")); %></td>
		   		<td><%out.println(rs.getString("firstname")); %></td>
		    		<td><%out.println(rs.getString("lastname")); %></td>
		    		<td><%out.println(rs.getString("email")); %></td>
	    		</tr>

   		<%
       			}
   		%>
   	</table>
   	<%
	
        	rs.close();
        	stmt.close();
        	con.close();
   	}
   	catch(Exception e)
   	{
        	e.printStackTrace();
   	}
   %>
</div>
</form>
</div>
</body> 
</html>
		

