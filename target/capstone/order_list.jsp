<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://mysql-standalone:3306/";
String database = "water_services";
String userid = "rahul";
String password = "wipro@1234";
String id=request.getParameter("id");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>

<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 40%;
}

th, td {
  text-align: center;
  padding: 8px;
  
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #04AA6D;
  color: white;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
</style>
</head>
<body>
	<center>
<h2>Orders Details List</h2>
<input id="gfg" type="text" 
                 placeholder="Search here">
<table id='myTable' class="center" >
<tr>
	<th>id</th>
	<th>Name</th>
    <th>Address</th>
    <th>Contact</th>
	<th>Email</th>
	<th>Brand</th>
	<th>Quantity</th>
	<th>Status</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from orders";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody id="geeks">
<tr>
// <td><%=resultSet.getInt("id") %></td>
<td><%=resultSet.getString("Name") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("contact") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("brand")%></td>
<td><%=resultSet.getString("quantity")%></td>
<td><%=resultSet.getString("status")%></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</tbody>
</table>
<script>
            $(document).ready(function() {
                $("#gfg").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#geeks tr").filter(function() {
                        $(this).toggle($(this).text()
                        .toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
	</center>
</body>
</html>
