<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<%
if(session.getAttribute("login")!=null) //check login session user not access or back to index.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>
<form method="get">

<table border="2">
   <tr>

        <td>Customer Name</td>
	<td>Customer Email</td>
	<td>Brand< Selected/td>
	<td>address Info</td>
	
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String query="select * from orders";
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_services","rahul","wipro@1234");
       Statement stmt=con.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>

            <tr>

		    <td><%out.println(rs.getString("Name")); %></td>
		    <td><%out.println(rs.getString("email")); %></td>
			<td><%out.println(rs.getString("brand")); %></td>
		    <td><%out.println(rs.getString("address")); %></td>
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

