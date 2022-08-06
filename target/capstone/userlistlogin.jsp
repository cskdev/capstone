<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<form method="post">

<table border="2">
   <tr>

        <td>ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Email</td>
	
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
</form>`
